;;; sly-buttons.el --- Button-related utils for SLY
;;;
(require 'cl-lib)
(require 'sly-messages "lib/sly-messages")

(defvar sly-part-button-keymap
      (let ((map (make-sparse-keymap)))
        (set-keymap-parent map button-map)
        (define-key map [down-mouse-3] 'sly-button-popup-part-menu)
        (define-key map [mouse-3] 'sly-button-popup-part-menu)
        map))

(defvar sly-button-popup-part-menu-keymap
  (let ((map (make-sparse-keymap)))
    map))

(defun sly-button-popup-part-menu (event)
  "Popup a menu for a `sly-part' button"
  (interactive "@e")
  (let* ((button (button-at (posn-point (event-end event))))
         (label (button-get button 'part-label))
         (items (cdr (button-get button 'part-menu-keymap))))
    (popup-menu
     `(keymap
       ,@(when label
           `(,(truncate-string-to-width label 30 nil nil t)))
       ,@items))))

(defun sly-button-at (&optional pos type no-error)
  (let ((button (button-at (or pos
                               (if (mouse-event-p last-input-event)
                                   (posn-point (event-end last-input-event))
                                 (point))))))
    (cond ((and button type
                (button-type-subtype-p (button-type button) type))
           button)
          ((and button type)
           (unless no-error
             (error "[sly] Button at point is not of expected type %s" type)))
          (button
           button)
          (t
           (unless no-error
             (error "[sly] No button at point"))))))

(defmacro sly-button-define-part-action (action label key)
  `(progn
     (defun ,action (button)
       ,(format "%s the object under BUTTON."
                label)
       (interactive (list (sly-button-at)))
       (let ((fn (button-get button ',action))
             (args (button-get button 'part-args)))
         (cond ((and fn args)
                (apply fn args))
               (args
                (error (format "[sly] button of type `%s' doesn't implement `%s'"
                               (button-type button) ',action)))
               (fn
                (error (format "[sly] button %s doesn't have the `part-args' property"
                               button))))))
     ,@(when key
         `((define-key sly-part-button-keymap ,key
             '(menu-item "" ,action
                         :filter (lambda (cmd)
                                   (let ((button (sly-button-at)))
                                     (and button
                                          (button-get button ',action)
                                          cmd)))))))
     (define-key sly-button-popup-part-menu-keymap
       [,action] '(menu-item ,label ,action
                             :visible (let ((button (sly-button-at)))
                                        (and button
                                             (button-get button ',action)))))))

(sly-button-define-part-action sly-button-inspect      "Inspect"       (kbd "i"))
(sly-button-define-part-action sly-button-describe     "Describe"      (kbd "d"))
(sly-button-define-part-action sly-button-pretty-print "Pretty Print"  (kbd "p"))
(sly-button-define-part-action sly-button-show-source  "Show Source"   (kbd "v"))
(sly-button-define-part-action sly-button-goto-source  "Go To Source"  (kbd "."))

(defun sly-make-action-button (label action &rest props)
  (apply #'make-text-button
         label nil :type 'sly-action
         'action action
         'mouse-action action
         props)
  label)

(defface sly-action-face
  `((t (:inherit warning)))
  "Face for SLY buttons."
  :group 'sly)

(define-button-type 'sly-button
  'sly-button-search-id 'regular-button)

(define-button-type 'sly-action :supertype 'sly-button
  'face 'sly-action-face
  'mouse-face 'highlight
  'sly-button-echo 'sly-button-echo-button)

(defface sly-part-button-face
  '((t (:inherit font-lock-constant-face)))
  "Face for things which be interactively inspected, etc"
  :group 'sly)

(define-button-type 'sly-part :supertype 'sly-button
  'face 'sly-part-button-face
  'action 'sly-button-inspect
  'mouse-action 'sly-button-inspect
  'keymap  sly-part-button-keymap
  'sly-button-echo 'sly-button-echo-part
  'part-menu-keymap sly-button-popup-part-menu-keymap
  'help-echo "RET, mouse-2: Inspect object; mouse-3: Context menu"
  ;; these are ajust here for clarity
  ;; 
  'sly-button-inspect nil
  'sly-button-describe nil
  'sly-button-pretty-print nil
  'sly-button-show-source nil)

(defun sly-button-flash (button &optional face)
  (sly-flash-region (button-start button) (button-end button)
                    :timeout 0.07
                    :times 2
                    :face (or face 'highlight)))


(defun sly-button-echo-button (button) (sly-message "A sly button"))

(defun sly-button-echo-part (button)
  (sly-button-flash button)
  (sly-message (button-get button 'part-label)))


;;; Overlay-button specifics
;;;
(defun sly-button--overlays-in (beg end &optional filter)
  "Return overlays overlapping positions BEG and END"
  (cl-remove-if-not #'(lambda (button)
                        (and (button-type-subtype-p (button-type button) 'sly-button)
                             (or (not filter)
                                 (funcall filter button))))
                    (overlays-in beg end)))

(defun sly-button--overlays-between (beg end &optional filter)
  "Return overlays contained entirely between BEG and END"
  (cl-remove-if-not #'(lambda (button)
                        (and (>= (button-start button) beg)
                             (<= (button-end button) end)))
                    (sly-button--overlays-in beg end filter)))

(defun sly-button--overlays-exactly-at (beg end &optional filter)
  "Return overlays exactly between BEG and END"
  (cl-remove-if-not #'(lambda (button)
                        (and (= (button-start button) beg)
                             (= (button-end button) end)))
                    (sly-button--overlays-in beg end filter)))

(defun sly-button--overlays-at (&optional point filter)
  "Return overlays near POINT"
  (let ((point (or point (point))))
    (cl-sort (sly-button--overlays-in (1- point) (1+ point) filter)
             #'> :key #'sly-button--overlay-priority)))

(defun sly-button--overlay-priority (overlay)
  (or (overlay-get overlay 'priority) 0))



;;; Button navigation
;;;
(defvar sly-button--next-search-id 0)

(defun sly-button-next-search-id ()
  (cl-incf sly-button--next-search-id))

(defun sly-button--searchable-buttons-at (pos filter)
  (let* ((probe (sly-button-at pos 'sly-button 'no-error))
         (non-overlay-button (and probe
                                  (not (overlayp probe))
                                  probe)))
    (cl-remove-duplicates
     (append (sly-button--overlays-at pos filter)
             (if (and non-overlay-button
                      (or (not filter)
                          (funcall filter non-overlay-button)))
                 (list non-overlay-button))))))

(defun sly-button--searchable-buttons-starting-at (&optional point filter)
  (let ((point (or point (point))))
    (cl-remove-if-not #'(lambda (button)
                        (= (button-start button) point))
                      (sly-button--searchable-buttons-at point filter))))



(defvar sly-button--last-search-command nil)

(defun sly-button--search-1 (n filter)
  (cl-loop with off-by-one = (if (cl-plusp n) -1 +1)
           for search-start = (point) then pos
           for preval = (and (not (cond ((cl-plusp n)
                                         (= search-start (point-min)))
                                        (t
                                         (= search-start (point-max)))))
                             (get-char-property (+ off-by-one
                                                   search-start)
                                                'sly-button-search-id))
           for pos = (funcall
                      (if (cl-plusp n)
                          #'next-single-char-property-change
                        #'previous-single-char-property-change)
                      search-start
                      'sly-button-search-id)
           for newval = (get-char-property pos 'sly-button-search-id)
           until (cond ((cl-plusp n)
                        (= pos (point-max)))
                       (t
                        (= pos (point-min))))
           for buttons = (sly-button--searchable-buttons-at
                          pos (or filter #'identity))
           when (and buttons
                     newval
                     (not (eq newval preval))
                     (eq pos (button-start (car buttons))))
           return buttons))

(defun sly-button-search (n &optional filter)
  "Go forward to Nth buttons verifying FILTER and echo it.

With negative N, go backward.  Visiting is done via the
`sly-button-echo' property.

If more than one button overlap the same region, the button
starting before is visited first. If more than one button start
at exactly the same spot, they are both visited simultaneously,
`sly-button-echo' being passed a variable number of button arguments."
  (cl-loop for i from 0 below (abs n)
           for buttons = (or (and (not (eq this-command sly-button--last-search-command))
                                  (sly-button--searchable-buttons-starting-at (point)))
                             (sly-button--search-1 n filter))
           for button = (car buttons)
           while buttons
           finally
           (setq sly-button--last-search-command this-command)
           (cond (buttons
                  (goto-char (button-start (car buttons)))
                  (apply (button-get button 'sly-button-echo)
                         button
                         (cl-remove-if-not
                          #'(lambda (b)
                              (= (button-start b) (button-start button)))
                          (cdr buttons))))
                 (t
                  (sly-error "No more buttons!")))))

(defvar sly-button-filter-function #'identity
  "Filter buttons considered by `sly-button-forward'
Set to `sly-note-button-p' to only navigate compilation notes,
or leave at `identity' to visit every `sly-button' in the buffer.'")

(defun sly-button-forward (n)
  "Go to and describe the next button in the buffer."
  (interactive "p")
  (sly-button-search n sly-button-filter-function))

(defun sly-button-backward (n)
  "Go to and describe the previous button in the buffer."
  (interactive "p")
  (sly-button-forward (- n)))

(provide 'sly-buttons)

;;; sly-buttons.el ends here
