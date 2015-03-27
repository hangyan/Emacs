;;; sx-interaction.el --- Voting, commenting, and otherwise interacting with questions.  -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Artur Malabarba

;; Author: Artur Malabarba <bruce.connor.am@gmail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This file holds a series of functions for performing arbitrary
;; interactions with arbitrary objects (objects here always mean the
;; alist of a question, answer, or comment). All commands take at
;; least a DATA argument corresponding to the object which, when
;; called interactively, is always derived from the context at point
;; (usually using the `sx--data-here' function).
;;
;; Interactions represented here involve voting, commenting, asking,
;; answering, editing.
;;
;; These are commands are meant to be available throughout the
;; interface. So it didn't make sense to put them in a specific
;; module. They also rely on a lot of dependencies, so they couldn't
;; be put in sx.el.


;;; Code:
(eval-when-compile
  '(require 'cl-lib))

(require 'sx)
(require 'sx-question)
(require 'sx-question-mode)
(require 'sx-question-list)
(require 'sx-compose)


;;; Using data in buffer
(defun sx--data-here (&optional type noerror)
  "Get the alist regarding object under point of type TYPE.
Looks at the text property `sx--data-here'. If it's not set, it
looks at a few other reasonable variables. If those fail too, it
throws an error.

TYPE is a symbol restricting the type of object desired. Possible
values are 'question, 'answer, 'comment, or nil (for any type).

If no object of the requested type could be returned, an error is
thrown unless NOERROR is non-nil."
  (or (let ((data (get-char-property (point) 'sx--data-here)))
        (if (null type) data
          (sx-assoc-let type
            ;; Is data of the right type?
            (cl-case type
              (question (when .title data))
              (answer (when .answer_id data))
              (comment (when .comment_id data))))))
      ;; The following two only ever return questions.
      (when (or (null type) (eq type 'question))
        ;; @TODO: `sx-question-list-mode' may one day display answers.
        ;; Ideally, it would use the `sx--data-here' (so no special
        ;; handling would be necessary.
        (or (and (derived-mode-p 'sx-question-list-mode)
                 (tabulated-list-get-id))
            (and (derived-mode-p 'sx-question-mode)
                 sx-question-mode--data)))
      ;; Nothing was found
      (and (null noerror)
           (error "No %s found here" (or type "data")))))

(defun sx--error-if-unread (data)
  "Throw a user-error if DATA is an unread question.
If it's not a question, or if it is read, return DATA."
  ;; If we found a question, we may need to check if it's read.
  (if (and (assoc 'title data)
           (null (sx-question--read-p data)))
      (user-error "Question not yet read. View it before acting on it")
    data))

(defun sx--maybe-update-display (&optional buffer)
  "Refresh whatever is displayed in BUFFER or the current buffer.
If BUFFER is not live, nothing is done."
  (setq buffer (or buffer (current-buffer)))
  (when (buffer-live-p buffer)
    (cond ((derived-mode-p 'sx-question-list-mode)
           (sx-question-list-refresh 'redisplay 'no-update))
          ((derived-mode-p 'sx-question-mode)
           (sx-question-mode-refresh 'no-update)))))

(defun sx--copy-data (from to)
  "Copy all fields of alist FORM onto TO.
Only fields contained in TO are copied."
  (setcar to (car from))
  (setcdr to (cdr from)))


;;; Visiting
(defun sx-visit (data &optional copy-as-kill)
  "Visit DATA in a web browser.
DATA can be a question, answer, or comment. Interactively, it is
derived from point position.

If copy-as-kill is non-nil, do not call `browse-url'.
Instead, copy the link as a new kill with `kill-new'.
Interactively, this is specified with a prefix argument.

If DATA is a question, also mark it as read."
  (interactive (list (sx--data-here) current-prefix-arg))
  (sx-assoc-let data
    (let ((link
           (when (stringp .link)
             (funcall (if copy-as-kill #'kill-new #'browse-url)
               .link))))
      (when (and (called-interactively-p 'any) copy-as-kill)
        (message "Copied: %S" link)))
    (when (and .title (not copy-as-kill))
      (sx-question--mark-read data)
      (sx--maybe-update-display))))


;;; Displaying
(defun sx-display-question (&optional data focus window)
  "Display question given by DATA, on WINDOW.
When DATA is nil, display question under point. When FOCUS is
non-nil (the default when called interactively), also focus the
relevant window. 

If WINDOW nil, the window is decided by
`sx-question-mode-display-buffer-function'."
  (interactive (list (sx--data-here) t))
  (when (sx-question--mark-read data)
    (sx--maybe-update-display))
  ;; Display the question.
  (setq window
        (get-buffer-window
         (sx-question-mode--display data window)))
  (when focus
    (if (window-live-p window)
        (select-window window)
      (switch-to-buffer sx-question-mode--buffer))))


;;; Voting
(defun sx-toggle-upvote (data)
  "Apply or remove upvote from DATA.
DATA can be a question, answer, or comment. Interactively, it is
guessed from context at point."
  (interactive (list (sx--error-if-unread (sx--data-here))))
  (sx-assoc-let data
    (sx-set-vote data "upvote" (null (eq .upvoted t)))))

(defun sx-toggle-downvote (data)
  "Apply or remove downvote from DATA.
DATA can be a question or an answer. Interactively, it is guessed
from context at point."
  (interactive (list (sx--error-if-unread (sx--data-here))))
  (sx-assoc-let data
    (sx-set-vote data "downvote" (null (eq .downvoted t)))))

(defun sx-set-vote (data type status)
  "Set the DATA's vote TYPE to STATUS.
DATA can be a question, answer, or comment. TYPE can be
\"upvote\" or \"downvote\". STATUS is a boolean.

Besides posting to the api, DATA is also altered to reflect the
changes."
  (let ((result
         (sx-assoc-let data
           (sx-method-call
               (cond
                (.comment_id "comments")
                (.answer_id "answers")
                (.question_id "questions"))
             :id (or .comment_id .answer_id .question_id)
             :submethod (concat type (unless status "/undo"))
             :auth 'warn
             :url-method "POST"
             :filter sx-browse-filter
             :site .site))))
    ;; The api returns the new DATA.
    (when (> (length result) 0)
      (sx--copy-data (elt result 0) data)
      ;; Display the changes in `data'.
      (sx--maybe-update-display))))


;;; Commenting
(defun sx-comment (data &optional text)
  "Post a comment on DATA given by TEXT.
DATA can be a question, an answer, or a comment. Interactively,
it is guessed from context at point.
If DATA is a comment, the comment is posted as a reply to it.

TEXT is a string. Interactively, it is read from the minibufer."
  (interactive (list (sx--error-if-unread (sx--data-here)) 'query))
  ;; When clicking the "Add a Comment" button, first arg is a marker.
  (when (markerp data)
    (setq data (sx--data-here))
    (setq text 'query))
  (sx-assoc-let data
    ;; Get the comment text
    (when (eq text 'query)
      (setq text (read-string
                  "Comment text: "
                  (when .comment_id
                    (concat (sx--user-@name .owner) " "))))
      (while (< (string-width text) 15)
        (setq text (read-string "Comment text (at least 15 characters): " text))))
    ;; If non-interactive, `text' could be anything.
    (unless (stringp text)
      (error "Comment body must be a string"))
    ;; And post
    (let ((result
           (sx-method-call 'posts
             :id (or .post_id .answer_id .question_id)
             :submethod "comments/add"
             :auth 'warn
             :url-method "POST"
             :filter sx-browse-filter
             :site .site
             :keywords `((body . ,text)))))
      ;; The api returns the new DATA.
      (when (> (length result) 0)
        (sx--add-comment-to-object
         (elt result 0)
         (if .post_id
             (sx--get-post .post_type .site .post_id)
           data))
        ;; Display the changes in `data'.
        (sx--maybe-update-display)))))

(defun sx--get-post (type site id)
  "Find in the database a post identified by TYPE, SITE and ID.
TYPE is `question' or `answer'. 
SITE is a string.
ID is an integer."
  (let ((db (cons sx-question-mode--data
                  sx-question-list--dataset)))
    (setq db
          (cond 
           ((string= type "question") db)
           ((string= type "answer")
            (apply #'cl-map 'list #'identity
                   (mapcar (lambda (x) (cdr (assoc 'answers x))) db)))))
    (car (cl-member-if
          (lambda (x) (sx-assoc-let x
                   (and (equal (or .answer_id .question_id) id)
                        (equal .site site))))
          db))))

(defun sx--add-comment-to-object (comment object)
  "Add COMMENT to OBJECT's `comments' property.
OBJECT can be a question or an answer."
  (let ((com-cell (assoc 'comments object)))
    (if com-cell
        (progn
          (setcdr
           com-cell
           (apply #'vector
             (append
              (cl-map 'list #'identity
                      (cdr com-cell))
              (list comment)))))
      ;; No previous comments, add it manually.
      (setcdr object (cons (car object) (cdr object)))
      (setcar object `(comments . [,comment])))))


;;; Editing
(defun sx-edit (data)
  "Start editing an answer or question given by DATA.
DATA is an answer or question alist. Interactively, it is guessed
from context at point."
  (interactive (list (sx--data-here)))
  ;; If we ever make an "Edit" button, first arg is a marker.
  (when (markerp data) (setq data (sx--data-here)))
  (sx-assoc-let data
    (when .comment_id (user-error "Editing comments is not supported yet"))
    (let ((buffer (current-buffer)))
      (pop-to-buffer
       (sx-compose-create
        .site data nil
        ;; After send functions
        (list (lambda (_ res)
                (sx--copy-data (elt res 0) data)
                (sx--maybe-update-display buffer))))))))


;;; Asking
(defcustom sx-default-site "emacs"
  "Name of the site to use by default when listing questions."
  :type 'string
  :group 'sx)

(defun sx--interactive-site-prompt ()
  "Query the user for a site."
  (let ((default (or sx-question-list--site
                     (sx-assoc-let sx-question-mode--data .site)
                     sx-default-site)))
    (funcall (if ido-mode #'ido-completing-read #'completing-read)
      (format "Site (%s): " default)
      (sx-site-get-api-tokens) nil t nil nil
      default)))

(defun sx-ask (site)
  "Start composing a question for SITE.
SITE is a string, indicating where the question will be posted."
  (interactive (list (sx-tab--interactive-site-prompt)))
  (let ((buffer (current-buffer)))
    (pop-to-buffer
     (sx-compose-create
      site nil nil
      ;; After send functions
      (list (lambda (_b _res) (sx--maybe-update-display buffer)))))))


;;; Answering
(defun sx-answer (data)
  "Start composing an answer for question given by DATA.
DATA is a question alist. Interactively, it is guessed from
context at point. "
  ;; If the user tries to answer a question that's not viewed, he
  ;; probaby hit the button by accident.
  (interactive
   (list (sx--error-if-unread (sx--data-here 'question))))
  ;; When clicking the "Write an Answer" button, first arg is a marker.
  (when (markerp data) (setq data (sx--data-here)))
  (let ((buffer (current-buffer)))
    (sx-assoc-let data
      (pop-to-buffer
       (sx-compose-create
        .site .question_id nil
        ;; After send functions
        (list (lambda (_ res)
                (sx--add-answer-to-question-object
                 (elt res 0) sx-question-mode--data)
                (sx--maybe-update-display buffer))))))))

(defun sx--add-answer-to-question-object (answer question)
  "Add alist ANSWER to alist QUESTION in the right place."
  (let ((cell (assoc 'answers question)))
    (if cell
        (setcdr cell (apply #'vector
                       (append (cdr cell) (list answer))))
      ;; No previous comments, add it manually.
      (setcdr question (cons (car question) (cdr question)))
      (setcar question `(answers . [,answer])))))

(provide 'sx-interaction)
;;; sx-interaction.el ends here
