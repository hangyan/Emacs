;;; Poorman's Simple MIME Composer for Emacs
;; Copyright (C) 1993 Masanobu UMEDA

;; Author: Masanobu UMEDA <umerin@mse.kyutech.ac.jp>
;; Version: $Header: mime.el,v 1.19 93/07/05 21:33:36 umerin Locked $
;; Keywords: mail, news, mime

;; This file is part of GNU Emacs.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; LCD Archive Entry:
;; mime|Masanobu UMEDA|umerin@mse.kyutech.ac.jp|
;; Simple MIME Composer|
;; $Date: 93/07/05 21:33:36 $|$Revision: 1.19 $|~/misc/mime.el.Z|

;; This is an Emacs minor mode for editing Internet multimedia
;; messages encoded in MIME (RFC1341 and RFC1342).  All messages in
;; this mode are composed in the tagged MIME format, that are
;; described in the following examples.  The messages in the tagged
;; MIME format are automatically translated into a MIME compliant
;; message when exiting the mode.

;; Content-Type Tag:
;;	--[[TYPE/SUBTYPE; OPTIONS]]
;;
;; The tagged MIME message examples:
;;
;; This is a conventional plain text.  It should be translated into
;; text/plain.
;; 
;;--[[text/plain]]
;; This is also a plain text.  But, it is explicitly specified as is.
;;
;;--[[text/plain; charset=ISO-2022-JP]]
;; これは charset を ISO-2022-JP に指定した日本語の plain テキストです.
;;
;;--[[text/richtext]]
;; <center>This is a richtext.</center>
;;
;;--[[image/gif]]^MContent-Transfer-Encoding: base64^M...image comes here...
;;
;;--[[audio/basic]]^MContent-Transfer-Encoding: base64^M...audio comes here...

;;; Code:

(require 'sendmail)
(require 'mail-utils)

(autoload 'metamail-buffer "metamail"
	  "Process current buffer through 'metamail'." t)

(defvar mime-prefix "\C-c\C-x"
  "*Keymap prefix for MIME commands.")

(defvar mime-ignore-preceding-spaces nil
  "*Ignore preceding white spaces if non-nil.")

(defvar mime-ignore-trailing-spaces nil
  "*Ignore trailing white spaces if non-nil.")

(defvar mime-auto-fill-header t
  "*Fill header fields that contain encoded-words.")

(defvar mime-content-types
  '(("text"
     ("plain"
      ("charset" "ISO-2022-JP" "US-ASCII"))
     ("richtext"
      ("charset" "ISO-2022-JP" "US-ASCII")))
    ("message"
     ("external-body"
      ("access-type"
       ("anon-ftp"
	("site" "wnoc-fuk.wide.ad.jp" "nic.karrn.ad.jp")
	("directory")
	("name")
	("mode" "binary" "ascii"))
       ("ftp"
	("site")
	("directory")
	("name")
	("mode" "binary" "ascii"))
       ("tftp"
	("site")
	("name"))
       ("afs"
	("site")
	("name"))
       ("local-file"
	("site")
	("name"))
       ("mail-server"
	("server"))))
     ("rfc822"))
    ("application"
     ("postscript")
     ("octet-stream"
      ("name")
      ("type" "" "tar" "shar")
      ("conversions")
      ))
    ("image"
     ("gif")
     ("jpeg")
     ("x-xwd")
     ("x-xbm"))
    ("audio"
     ("basic"))
    ("video"
     ("mpeg")))
  "*Alist of content-type, subtype, options and its values.")

(defvar mime-file-types
  '(("\\.ps$"	"application"	"postscript"	nil)
    ("\\.gif$"	"image"		"gif"	nil)
    ("\\.xwd$"	"image"		"x-xwd"	nil)
    ("\\.xbm$"	"image"		"x-xbm"	nil)
    ("\\.jpg$"	"image"		"jpeg"	nil)
    ("\\.au$"	"audio"		"basic"	nil)
    ("\\.mpg$"	"video"		"mpeg"	nil))
  "*Alist of file name, types and options.")

(defvar mime-message-encoder
  '(("base64"			"mmencode"	"mmencode -u")
    ("b"			"mmencode"	"mmencode -u") ;in header
    ("quoted-printable"		"mmencode -q"	"mmencode -q -u")
    ("q"			"mmencode -q"	"mmencode -q -u") ;in header
    ("7bit"			nil nil) ;Default
    ("8bit"			nil nil)
    ("binary"			nil nil))
  "*Alist of encoding, encoder, and decoder.
Encoder and decoder is a command string, function symbol or lambda
list which take two arguments.  If it is nil, no conversion is done.")

(defvar mime-message-handler
  '(("text/richtext"		t)
    ("text/plain"		t)
    (t				mime-run-metamail))
  "*Alist of Content-type and its preview method.
The method can be a function symbol or a lambda list that takes a
region, nil or t.  nil means no handler is defined.  t means what you
see is what you get.  If content-type is t, it is a default.")

(defvar mime-charset-chooser
  (function mime-charset-chooser-for-nemacs)
  "*Function that identify charset of a text in a given region.")

(defvar mime-header-encoding-chooser
  (function mime-header-encoding-chooser-for-nemacs)
  "*Function to identify encoding method of a header in a give region.
The method is a form of (CHARSET . ENCODING), where ENCODING is either
'B' or 'Q'.  Nil means no encoding is necessary.")

(defvar mime-header-string-encoder
  (function mime-header-string-encoder-for-nemacs)
  "*Function to encode string for using in header for given encoding method.")

(defvar mime-voice-recorder
  (function mime-voice-recorder-for-sun)
  "*Function to record voice message.")

(defvar mime-max-header-length 76
  "*Any header should not exceed this value.")

(defvar mime-tspecials-regexp "[][()<>@,;:\\\\"/?.= \t]"
  "*Specify MIME tspecials.
Tspecials means any character that matches with it must be quoted.")

(defvar mime-tag-regexp "^--[[][[]\\([^]]*\\)]]"
  "*Regexp of Content-Type tag in the text.")

(defvar mime-tag-format "--[[%s]]"
  "*Control-string generating a Content-Type tag.")

(defvar mime-multipart-boundary "Multipart"
  "*Boundary of a multipart message.")


(defconst mime-version-number "1.0"
  "MIME version number.")

(defvar mime-mode-flag nil)
(make-variable-buffer-local 'mime-mode-flag)

(or (assq 'mime-mode-flag minor-mode-alist)
    (setq minor-mode-alist
	  (cons (list 'mime-mode-flag " MIME") minor-mode-alist)))

(defun mime-define-keymap (keymap)
  "Add MIME commands to KEYMAP."
  (if (not (keymapp keymap))
      nil
    (define-key keymap "\C-t" 'mime-insert-text)
    (define-key keymap "\C-v" 'mime-insert-voice)
    (define-key keymap "\C-e" 'mime-insert-external)
    (define-key keymap "\C-i" 'mime-include-file)
    (define-key keymap "\C-p" 'mime-preview-content)
    (define-key keymap "\C-z" 'mime-mode-exit)
    (define-key keymap "?" 'help-mime-mode)))

;;;###autoload
(defun mime-mode ()
  "Minor mode for editing the tagged MIME message.

In this mode, basically, the message should be composed in the tagged
MIME format.  The message tag looks like:

	'--[[text/plain; charset=ISO-2022-JP]]'.

The tag specifies the content-type, subtype, and options of the
message following the tag in terms of MIME.  Messages without any tag
are treated as text/plain by default.  Binary messages such as audio
and image are usually hidden in this mode using selective-display
facility.  The messages in the tagged MIME format are automatically
translated into a MIME compliant message when exiting the mode.

Commands with a prefix (specified by the variable mime-prefix):
C-t	mime-insert-text	insert text message
C-v	mime-insert-voice	insert voice message
C-e	mime-insert-external	insert reference to external body
C-i	mime-include-file	insert from a (binary) file
C-p	mime-preview-content	preview an included content
C-z	mime-mode-exit		Convert into MIME
?	help-mime-mode		show this message

Additional commands:
C-c C-s	mime-mode-exit-and-run	Convert into MIME and run original command
C-c C-c	mime-mode-exit-and-run	Convert into MIME and run original command

The following is a message example in the tagged MIME format (TABs at
the beginning of the line are not a part of the message):

	This is a conventional plain text.  It should be translated
	into text/plain.
	--[[text/plain]]
	This is also a plain text.  But, it is explicitly specified as
	is.
	--[[text/plain; charset=ISO-2022-JP]]
	これは charset を ISO-2022-JP に指定した日本語の plain テキス
	トです.
	--[[text/richtext]]
	<center>This is a richtext.</center>
	--[[image/gif]]^MContent-Transfer-Encoding: base64^M...image here...
	--[[audio/basic]]^Montent-Transfer-Encoding: base64^M...audio here...

Turning on MIME mode calls the value of mime-mode-hook, if they are
non-nil."
  (interactive)
  (if mime-mode-flag
      (error "You are already editing a MIME.")
    (setq mime-mode-flag t)
    ;; Remember old key bindings.
    (make-local-variable 'mime-mode-old-local-map)
    (setq mime-mode-old-local-map (current-local-map))
    ;; Add MIME commands to current local map.
    (use-local-map (copy-keymap (current-local-map)))
    (if (not (lookup-key (current-local-map) mime-prefix))
	(define-key (current-local-map) mime-prefix (make-sparse-keymap)))
    (mime-define-keymap (lookup-key (current-local-map) mime-prefix))
    ;; These are useful to avoid sending before conversion into
    ;; MIME in Mail mode and News mode.
    (define-key (current-local-map) "\C-c\C-c" 'mime-mode-exit-and-run)
    (define-key (current-local-map) "\C-c\C-s" 'mime-mode-exit-and-run)
    ;; Remember old selective-display.
    (make-local-variable 'mime-mode-old-selective-display)
    (setq mime-mode-old-selective-display selective-display)
    (setq selective-display t)
    ;; I don't care about saving these.
    (setq paragraph-start
	  (concat mime-tag-regexp "\\|" paragraph-start))
    (setq paragraph-separate
	  (concat mime-tag-regexp "\\|" paragraph-separate))
    (run-hooks 'mime-mode-hook)
    (message
     (substitute-command-keys
      "Type \\[mime-mode-exit] in this buffer to exit MIME mode."))
    ))

;;;###autoload
(fset 'edit-mime 'mime-mode)		; for convenience

(defun mime-mode-exit (&optional nomime)
  "Convert the tagged MIME message into MIME compliant message.
With no argument encode a message in the buffer into MIME, otherwise
just return to previous mode."
  (interactive "P")
  (if (not mime-mode-flag)
      (error "You aren't editing a MIME.")
    (if (not nomime)
	(mime-convert-buffer))
    (setq mime-mode-flag nil)
    ;; Restore previous state.
    (use-local-map mime-mode-old-local-map)
    (setq selective-display mime-mode-old-selective-display)
    (set-buffer-modified-p (buffer-modified-p))
    (message "Exit MIME mode.")
    ))

(defun mime-mode-exit-and-run ()
  "Run a command bound on the same key in old keymap after the conversion."
  (interactive)
  (let ((cmd (lookup-key mime-mode-old-local-map (this-command-keys))))
    (mime-mode-exit)
    (if cmd
	(call-interactively cmd))))

(defun help-mime-mode ()
  "Show help message about MIME mode."
  (interactive)
  (with-output-to-temp-buffer "*Help*"
    (princ "Edit MIME Mode:\n")
    (princ (documentation 'mime-mode))
    (print-help-return-message)))

(defun mime-insert-text ()
  "Insert text message."
  (interactive)
  (if (and (mime-insert-message "text" nil nil)
	   (looking-at mime-tag-regexp))
      (progn
	;; Make a space between the following message.
	(insert "\n")
	(forward-char -1))))

(defun mime-insert-voice ()
  "Insert voice message."
  (interactive)
  (mime-insert-message "audio" "basic" nil)
  (let ((buffer (funcall mime-voice-recorder)))
    (unwind-protect
	(mime-insert-binary-buffer buffer "base64")
      (kill-buffer buffer)
      )))

(defun mime-insert-external ()
  "Insert reference to external body."
  (interactive)
  (mime-insert-message "message" "external-body" nil ";\n\t")
  ;;(forward-char -1)
  ;;(insert "Content-description: " (read-string "Content-description: ") "\n")
  ;;(forward-line 1)
  (let* ((pritype (mime-prompt-for-type))
	 (subtype (mime-prompt-for-subtype pritype))
	 (options (mime-prompt-for-options pritype subtype ";\n\t")))
    (and pritype
	 subtype
	 (insert "Content-type: " pritype "/" subtype (or options "") "\n")))
  (if (and (not (eobp))
	   (not (looking-at mime-tag-regexp)))
      (insert (mime-make-text-tag) "\n")))

(defun mime-include-file (file)
  "Insert message from a file."
  (interactive "fInclude file: ")
  (let*  ((guess (mime-find-file-type file))
	  (pritype (nth 0 guess))
	  (subtype (nth 1 guess))
	  (options (nth 2 guess)))
    (mime-insert-message pritype subtype options)
    (mime-insert-binary-file file "base64")))

(defun mime-preview-content ()
  "Preview an included message content around point through metamail."
  (interactive)
  (save-excursion
    ;; Search for the beginning of the tagged MIME message.
    (if (looking-at mime-tag-regexp)
	nil
      ;; At first, go to the end.
      (if (re-search-forward mime-tag-regexp nil t)
	  (progn
	    (forward-line -1)
	    (end-of-line))
	(goto-char (point-max)))
      ;; Then search for the beginning. 
      (re-search-backward mime-tag-regexp nil t)
      (beginning-of-line))
    (if (looking-at mime-tag-regexp)
	(let* ((handler
		(mime-find-handler
		 (mime-strip-options
		  (buffer-substring (match-beginning 1) (match-end 1)))))
	       (beg (point))
	       (end (save-excursion
		      (forward-line 1)
		      (re-search-forward mime-tag-regexp nil 'move)
		      (point))))
	  (cond ((eq handler t)		;As is.
		 (message "Nothing to do.  You are seeing as is."))
		((or (symbolp handler) (consp handler))
		 (funcall handler beg end))
		(t
		 (ding) (message "No message handler defined."))
		))
      (ding) (message "No messages to preview around here.")
      )))


;; Additional commands

(defun mime-encode-region (encoding begin end)
  "Encode current buffer using ENCODING from BEGIN to END."
  (interactive
   (list (completing-read "Encoding: " mime-message-encoder nil 'req)
	 (region-beginning) (region-end)))
  (let* ((kanji-flag nil)
	 (encoding (or encoding "base64"))
	 (encoder (mime-find-encoder encoding)))
    (cond ((stringp encoder)
	   (shell-command-on-region begin end encoder t))
	  (encoder
	   (funcall encoder begin end))
	  )))

(defun mime-decode-region (encoding begin end)
  "Decode current buffer using ENCODING from BEGIN to END."
  (interactive
   (list (completing-read "Encoding: " mime-message-encoder nil 'req)
	 (region-beginning) (region-end)))
  (let* ((kanji-flag nil)
	 (encoding (or encoding "base64"))
	 (decoder (mime-find-decoder encoding)))
    (cond ((stringp decoder)
	   (shell-command-on-region begin end decoder t))
	  (decoder
	   (funcall decoder begin end))
	  )))


;; Insert new MIME tag at around point.

(defun mime-insert-message (&optional pritype subtype options delimiter)
  "Insert new MIME message tag.
If nothing is inserted, return nil."
  (let ((oldtag nil)
	(newtag nil)
	(current (point)))
    (setq pritype
	  (or pritype (mime-prompt-for-type)))
    (setq subtype
	  (or subtype (mime-prompt-for-subtype pritype)))
    (setq options
	  (or options (mime-prompt-for-options pritype subtype delimiter)))
    ;; Make a new MIME tag.
    (setq newtag (mime-make-tag pritype subtype options))
    ;; Find an old MIME tag.
    (setq oldtag
	  (save-excursion
	    (end-of-line)
	    (if (re-search-backward mime-tag-regexp nil t)
		(buffer-substring (match-beginning 0) (match-end 0)))))
    ;; We are only interested in TEXT.
    (if (and oldtag
	     ;;(not (string-match "[^a-zA-Z0-9]text/" oldtag))
	     (not (mime-text-tag-p oldtag)))
	(setq oldtag nil))
    ;; Copy the tag for a message at current point if necessary.
    (if (save-excursion
	  (forward-line -1)
	  (and (looking-at mime-tag-regexp)
	       (progn
		 (goto-char (match-end 0))
		 (not (= (following-char) ?\^M)))))
	(forward-line -1))
    (beginning-of-line)
    (if (and oldtag
	     (not (eobp))
	     (not (looking-at mime-tag-regexp))
	     (not (string-equal oldtag newtag)))
	(save-excursion
	  (insert oldtag "\n")))
    ;; Make a new tag.
    (if (or (not oldtag)
	    (not (string-equal oldtag newtag)))
	(progn
	  (insert newtag "\n")
	  t				;New entry is created.
	  )
      ;; Restore previous point.
      (goto-char current)
      nil				;Nothing is created.
      )
    ))

;; Insert the content of binary file after MIME tag.

(defun mime-insert-binary-file (file &optional encoding)
  "Insert binary FILE at point.
Optional argument specifies an encoding method such as base64 (default)."
  (let* ((encoding (or encoding "base64")))
    (save-restriction
      (narrow-to-region (1- (point)) (point))
      (insert "Content-Transfer-Encoding: " encoding "\n\n")
      (let ((start (point))
	    (kanji-flag nil))		;NEmacs hack.
	(insert-file-contents file)
	;; Encode binary message if necessary.
	(mime-encode-region encoding start (point-max)))
      (mime-flag-region (point-min) (1- (point-max)) ?\^M)
      (goto-char (point-max))
      )))

(defun mime-insert-binary-buffer (buffer &optional encoding)
  "Insert binary BUFFER at point.
Optional argument specifies an encoding method such as base64 (default)."
  (let* ((encoding (or encoding "base64")))
    (save-restriction
      (narrow-to-region (1- (point)) (point))
      (insert "Content-Transfer-Encoding: " encoding "\n\n")
      (let ((start (point))
	    (kanji-flag nil))		;NEmacs hack.
	(insert-buffer-substring buffer)
	;; Encode binary message if necessary.
	(mime-encode-region encoding start (point-max)))
      (mime-flag-region (point-min) (1- (point-max)) ?\^M)
      (goto-char (point-max))
      )))

(defun mime-run-metamail (begin end)
  "Run metamail on current tagged MIME message from BEGIN to END."
  (save-excursion
    (let ((tmpbuf (get-buffer-create " *MIME preview*")))
      (copy-to-buffer tmpbuf begin end)
      (set-buffer tmpbuf)
      ;; Mock Mail mode buffer.
      (goto-char (point-min))
      (insert "From: PreviewTheContent\n"
	      mail-header-separator "\n")
      ;; Then convert it into MIME. 
      (mime-convert-body)
      (goto-char (point-min))
      (if (search-forward (concat "\n" mail-header-separator "\n") nil t)
	  (replace-match "\n\n"))
      ;; Preview the content using metamail.
      (metamail-buffer)
      (kill-buffer tmpbuf)
      )))

(defun mime-encode-string (encoding string)
  "Using ENCODING encode a STRING."
  (save-excursion
    (set-buffer (get-buffer-create " *MIME encoding*"))
    (erase-buffer)
    (insert string)
    (mime-encode-region encoding (point-min) (point-max))
    ;; Unfold lines since mmencode breaks long lines.
    (goto-char (point-min))
    (while (re-search-forward "\n" nil t)
      (replace-match ""))
    (prog1
	(buffer-substring (point-min) (point-max))
      (kill-buffer (current-buffer)))))

(defun mime-decode-string (encoding string)
  "Using ENCODING decode a STRING."
  (save-excursion
    (set-buffer (get-buffer-create " *MIME decoding*"))
    (erase-buffer)
    (insert string)
    (mime-decode-region encoding (point-min) (point-max))
    (prog1
	(buffer-substring (point-min) (point-max))
      (kill-buffer (current-buffer)))))

(defun mime-find-encoder (encoding)
  "Return encoder of message for ENCODING."
  (and encoding
       (nth 1 (assoc (downcase encoding) mime-message-encoder))))

(defun mime-find-decoder (encoding)
  "Return decoder of message for ENCODING."
  (and encoding
       (nth 2 (assoc (downcase encoding) mime-message-encoder))))

(defun mime-find-file-type (file)
  "Guess Content-Type, subtype, and options from FILE."
  (let ((guess nil)
	(guesses mime-file-types))
    (while (and (not guess) guesses)
      (if (string-match (car (car guesses)) file)
	  (setq guess (cdr (car guesses))))
      (setq guesses (cdr guesses)))
    guess
    ))

(defun mime-find-handler (type)
  "Return message handler for Content-type TYPE."
  (and type
       (let ((pair (assoc (downcase type) mime-message-handler)))
	 (if pair
	     (nth 1 pair)
	   ;; Search default if no entry.
	   (nth 1 (assoc t mime-message-handler))))))

(defun mime-strip-options (content-type)
  "Return content-type and subtype without options."
  (if (string-match "^[ \t]*\\([^; \t\n]*\\)" content-type)
      (substring content-type (match-beginning 1) (match-end 1)) nil))

(defun mime-prompt-for-type ()
  "Ask for Content-type."
  (completing-read "Content-Type: "
		   mime-content-types
		   nil
		   t
		   nil
		   ))

(defun mime-prompt-for-subtype (pritype)
  "Ask for Content-type subtype for Content-Type PRITYPE."
  (let* ((default (car (car (cdr (assoc pritype mime-content-types)))))
	 (answer
	  (completing-read (if default
			       (concat
				"Content subtype: (default " default ") ")
			     "Content subtype: ")
			   (cdr (assoc pritype mime-content-types))
			   nil
			   t
			   ""
			   )))
    (if (string-equal answer "") default answer)))

(defun mime-prompt-for-options (pritype subtype &optional delimiter)
  "Ask for Content-type options for Content-Type PRITYPE and SUBTYPE.
Optional DELIMITER specifies option delimiter (';' by default)."
  (let* ((delimiter (or delimiter "; "))
	 (options
	  (mapconcat
	   (function identity)
	   (delq nil
		 (mime-prompt-for-options-1
		  (cdr (assoc subtype
			      (cdr (assoc pritype mime-content-types))))))
	   delimiter
	   )))
    (if (and (stringp options)
	     (not (string-equal options "")))
	(concat delimiter options)
      ""				;"" if no options
      )))

(defun mime-prompt-for-options-1 (optlist)
  (apply (function append)
	 (mapcar (function mime-prompt-for-option) optlist)))

(defun mime-prompt-for-option (option)
  "Ask for OPTION.
Option must be '(PROMPT CHOICE1 (CHOISE2 ...))."
  (let* ((prompt (car option))
	 (choices (mapcar (function
			   (lambda (e)
			     (if (consp e) e (list e))))
			  (cdr option)))
	 (default (car (car choices)))
	 (answer nil))
    (if choices
	(progn
	  (setq answer
		(completing-read
		 (concat prompt
			 ": (default "
			 (if (string-equal default "") "\"\"" default)
			 ") ")
		 choices nil nil ""))
	  ;; If nothing is selected, use default.
	  (if (string-equal answer "")
	      (setq answer default)))
      (setq answer
	    (read-string (concat prompt ": "))))
    (cons (if (and answer
		   (not (string-equal answer "")))
	      (concat prompt "="
		      ;; Note: control characters ignored!
		      (if (string-match mime-tspecials-regexp answer)
			  (concat "\"" answer "\"") answer)))
	  (mime-prompt-for-options-1 (cdr (assoc answer (cdr option)))))
    ))

(defun mime-make-tag (pritype subtype &optional options)
  "Make a tag of MIME message of PRITYPE, SUBTYPE and optional OPTIONS."
  (format mime-tag-format
	  (concat (or pritype "") "/" (or subtype "") (or options ""))))

(defun mime-make-text-tag ()
  "Make a tag for a text.
Content-type is 'text' and its subtype is obtained from mime-content-types.
Charset is inferenced from the message content."
  (save-excursion
    (let* ((pritype "text")
	   (subtype (car (car (cdr (assoc pritype mime-content-types)))))
	   (begin (point)))
      ;; Move to the end of this text.
      (if (re-search-forward mime-tag-regexp nil 'move)
	  (beginning-of-line))
      (mime-make-tag pritype subtype
		     (concat "; charset="
			     (funcall mime-charset-chooser begin (point))))
      )))

(defun mime-text-tag-p (tag)
  "Non-nil if TAG is a kind of text content-type."
  (and (string-match mime-tag-regexp tag)
       (string-match "^text\\(/\\|$\\)"
		     (substring tag (match-beginning 1) (match-end 1)))))

(defun mime-flag-region (from to flag)
  "Hides or shows lines from FROM to TO, according to FLAG.
If FLAG is `\\n' (newline character) then text is shown,
while if FLAG is `\\^M' (control-M) the text is hidden."
  (let ((buffer-read-only nil)		;Okay even if write protected.
	(modp (buffer-modified-p)))
    (unwind-protect
        (subst-char-in-region from to
			      (if (= flag ?\n) ?\^M ?\n)
			      flag t)
      (set-buffer-modified-p modp))))

;;(defun mime-default-options (pritype subtype)
;;  "Return default options for content-type PRITYPE and SUBTYPE."
;;  (mapconcat
;;   (function
;;    (lambda (optlist)
;;      (concat (car optlist)
;;	      "="
;;	      (car (cdr optlist)))))
;;   (cdr (assoc subtype (cdr (assoc pritype mime-content-types))))
;;   "; "
;;   ))


;; Translate the tagged MIME messages into a MIME compliant message.

(defun mime-convert-buffer ()
  "Encode the tagged MIME message in current buffer in MIME compliant message."
  (interactive)
  (mime-convert-header)
  (mime-convert-body))

(defun mime-convert-header ()
  "Encode headers in MIME compliant message headers."
  (interactive)
  (save-excursion
    (save-restriction
      (goto-char (point-min))
      (search-forward (concat "\n" mail-header-separator "\n") nil t)
      (narrow-to-region (point-min) (point))
      (goto-char (point-min))
      (while (re-search-forward "^[^ \t\n:]+:[ \t]*" nil t)
	(let* ((beg (point))
	       (end (progn
		      (while (progn (forward-line 1) (looking-at "[ \t]")))
		      (1- (point)))))
	  (if (funcall mime-header-encoding-chooser beg end)
	      (let* ((string (buffer-substring beg end))
		     (newstr (mime-convert-header-string string))
		     (fill-column mime-max-header-length)
		     (fill-prefix " "))
		(if (not (string-equal string newstr))
		    (save-excursion
		      (goto-char beg)
		      (delete-region beg end)
		      (insert newstr)
		      ;; Fill header fields.
		      (if mime-auto-fill-header
			  ;; The region must end with a newline to
			  ;; fill the region without inserting extra
			  ;; newline.
			  (fill-region-as-paragraph beg (1+ (point))))
		      ))))
	  ))
      )))

(defun mime-convert-header-string (string)
  "Encode STRING suitable for using in header."
  (save-excursion
    (let* ((poslist nil)		;Possible break points.
	   (last-encoding nil)		;last chunk encoding
	   (this-encoding nil)		;this chunk encoding
	   (start nil)			;Chunk start point
	   (chunk nil)
	   (saved nil)			;Saved last line.
	   (separator nil)
	   (result ""))
      (set-buffer (get-buffer-create " *MIME header*"))
      (erase-buffer)
      (insert string)
      ;; Replace white spaces for continuation line with a space.
      (goto-char (point-min))
      (while (re-search-forward "\n[ \t]*" nil t)
	(replace-match " "))
      ;; Encode string
      (goto-char (point-min))
      (while (not (eobp))
	(setq start (point))
	;; Set initial code.
	(setq last-encoding this-encoding) 
	(setq this-encoding
	      (funcall mime-header-encoding-chooser
		       start
		       (save-excursion
			 (forward-char 1) (point))))
	(setq poslist (mime-search-for-code-boundary))
	(if (not this-encoding)
	    (setq chunk (buffer-substring start (point)))
	  ;; Break line if too long in terms of RFC1342.
	  (let ((repeat t))
	    (while repeat
	      (setq chunk
		    (funcall mime-header-string-encoder
			     this-encoding
			     (buffer-substring start (point))))
	      (if (<= (length chunk) mime-max-header-length)
		  (setq repeat nil)
		;; Must break since too long.
		(setq poslist (cdr poslist))
		(if poslist
		    ;; There is a break point candidate.
		    (progn
		      (goto-char (car poslist))
		      (skip-chars-backward " \t"))
		  ;; Still too long, so insert a newline.
		  (backward-char
		   (max 1
			(/ (* (- (point) start)
			      (- (length chunk) mime-max-header-length))
			   (- (length chunk)
			      (length (car this-encoding))
			      (length (cdr this-encoding)) 6))))
		  ))
	      ))
	  )
	;; Fold line if necessary.
	;; BUG: An extra space may be inserted after a white space
	;; followed by non-ascii characters.
	(cond ((string-equal result "")
	       (setq saved chunk)
	       (setq separator ""))
	      ((and (or last-encoding this-encoding)
		    (> (length (concat saved chunk))
		       mime-max-header-length))
	       (setq saved (concat chunk " "))
	       (setq separator "\n "))
	      ;; (not (equal last-encoding this-encoding))
	      ((and last-encoding (not this-encoding)
		    (> (length (concat saved " " chunk))
		       mime-max-header-length))
	       (setq saved (concat chunk " "))
	       (setq separator "\n "))
	      ;; (not (equal last-encoding this-encoding))
	      ((and last-encoding (not this-encoding)
		    (string-match "^[^ \t]" chunk))
	       (setq saved (concat saved " " chunk))
	       (setq separator " "))
	      (t
	       (setq saved (concat saved chunk))
	       (setq separator "")))
	(setq result (concat result separator chunk)))
      (kill-buffer (current-buffer))
      result
      )))

(defun mime-search-for-code-boundary ()
  "Search for code boundary starting from current point and return points."
  (let ((repeat t)
	(lastwhite nil)
	(poslist nil)			;possible boundary points
	(encoding (and (not (eobp))
		       (funcall mime-header-encoding-chooser
				(point)
				(save-excursion
				  (forward-char 1) (point))))))
    (while repeat
      (while (and (not (eobp))
		  (equal encoding
			 (funcall mime-header-encoding-chooser
				  (point)
				  (save-excursion
				    (forward-char 1) (point)))))
	(setq lastwhite nil)
	(forward-char 1))
      ;; Remember the candidate.
      (if (not lastwhite)
	  (setq poslist (cons (point) poslist)))
      ;; Iterate if the next of the next whitespace is the same.
      (if (looking-at "[ \t]")
	  (skip-chars-forward " \t")
	(setq repeat nil))
      (setq lastwhite t)
      )
    ;; Goto the last point.
    (goto-char (car poslist))
    poslist
    ))

(defun mime-convert-body ()
  "Encode the tagged MIME body in current buffer in MIME compliant message."
  (interactive)
  (save-excursion
    (let ((boundary
	   (concat mime-multipart-boundary " " (current-time-string)))
	  (ctype nil)			;Content type
	  (fields nil)			;Some additional fields
	  (npart 0))			;Number of body part
      (save-restriction
	;; We are interested in message body.
	(let* ((beg
		(progn
		  (goto-char (point-min))
		  (re-search-forward
		   (concat "\n" mail-header-separator
			   (if mime-ignore-preceding-spaces
			       "[ \t\n]*\n" "\n")) nil 'move)
		  (point)))
	       (end
		(progn
		  (goto-char (point-max))
		  (and mime-ignore-trailing-spaces
		       (re-search-backward "[^ \t\n]\n" beg t)
		       (forward-char 1))
		  (point))))
	  (narrow-to-region beg end))
	;; Counting the number of Content-Type.
	(goto-char (point-min))
	(while (re-search-forward mime-tag-regexp nil t)
	  (setq npart (1+ npart)))
	;; Normalize the body.
	(goto-char (point-min))
	;; Insert the first MIME tags if necessary.
	(if (not (looking-at mime-tag-regexp))
	    (progn
	      (setq npart (1+ npart))
	      (insert (mime-make-text-tag) "\n")
	      ))
	;; Insert MIME tags after mmencoded messages.
	(while (re-search-forward mime-tag-regexp nil t)
	  (if (= (following-char) ?\^M)
	      (progn
		(forward-line 1)
		(if (and (not (eobp))
			 (not (looking-at mime-tag-regexp)))
		    (progn
		      (setq npart (1+ npart))
		      (insert (mime-make-text-tag) "\n")))
		))
	  )
	;; Begin translation.
	(cond ((<= npart 1)
	       ;; It's a singular message.
	       (goto-char (point-min))
	       (while (re-search-forward mime-tag-regexp nil t)
		 (setq ctype
		       (buffer-substring (match-beginning 1) (match-end 1)))
		 (delete-region (match-beginning 0)
				(match-end 0))
		 (if (= (following-char) ?\^M)
		     (save-restriction
		       (narrow-to-region (point)
					 (save-excursion
					   (end-of-line) (point)))
		       ;; Show the text hiden with selective display.
		       (mime-flag-region (point-min) (point-max) ?\n)
		       (goto-char (point-min))
		       (if (search-forward "\n\n" nil t)
			   (progn
			     (setq fields
				   (buffer-substring (point-min)
						     (- (point) 2)))
			     (delete-region (point-min) (point)))))
		   ;; Delete the following newline.
		   (delete-char 1))
		 ))
	      (t
	       ;; It's a multipart message.
	       (goto-char (point-min))
	       (while (re-search-forward mime-tag-regexp nil t)
		 (setq ctype
		       (buffer-substring (match-beginning 1) (match-end 1)))
		 (delete-region (match-beginning 0) (match-end 0))
		 (insert "--" boundary "\n")
		 (insert "Content-Type: " ctype)
		 ;; Show the text hiden with selective display.
		 (if (= (following-char) ?\^M)
		     (mime-flag-region (progn (beginning-of-line) (point))
				       (progn (end-of-line) (point))
				       ?\n)
		   (insert "\n"))
		 )
	       ;; Insert the trailer.
	       (goto-char (point-max))
	       (if (not (= (preceding-char) ?\n))
		   ;; Boundary must start with a newline.
		   (insert "\n"))
	       (insert "--" boundary "--\n"))
	      )
	)
      ;; Make primary MIME headers.
      (or (mail-position-on-field "Mime-Version")
	  (insert mime-version-number))
      ;; Remove old Content-Type and other fields.
      (save-restriction
	(goto-char (point-min))
	(search-forward (concat "\n" mail-header-separator "\n") nil t)
	(narrow-to-region (point-min) (point))
	(goto-char (point-min))
	(mime-delete-field "Content-Type")
	(mime-delete-field "Content-Transfer-Encoding"))
      ;; Then, insert new Content-Type field.
      (cond ((<= npart 1)
	     (mail-position-on-field "Content-Type")
	     (insert ctype)
	     ;; Insert additional fields if exists.
	     (if fields
		 (insert fields)))
	    (t
	     (mail-position-on-field "Content-Type")
	     (insert "multipart/mixed; boundary=\"" boundary "\""))
	    )
      )))

(defun mime-delete-field (field)
  "Delete header FIELD."
  (let ((regexp (format "^%s:[ \t]*" field)))
    (goto-char (point-min))
    (while (re-search-forward regexp nil t)
      (delete-region (match-beginning 0)
		     (progn (forward-line 1) (point)))
      )))


;;;
;;; Platform dependents functions
;;;

(defun mime-charset-chooser-for-nemacs (begin end)
  "Identify charset of a message in a given region (NEmacs only)."
  (cond ((and (fboundp 'check-region-kanji-code) ;In case of NEmacs.
	      (check-region-kanji-code begin end))
	 "ISO-2022-JP")
	(t "us-ascii")			;Default charset of MIME.
	))

(defun mime-header-encoding-chooser-for-nemacs (begin end)
  "Return header encoding method for a given region (NEmacs only)."
  (cond ((and (fboundp 'check-region-kanji-code) ;In case of NEmacs.
	      (check-region-kanji-code begin end))
	 '("ISO-2022-JP" . "B"))
	(t nil)				;No encoding is necessary.
	))

(defun mime-header-string-encoder-for-nemacs (method string)
  "For given encoding METHOD encode STRING for using in header (NEmacs only)."
  (let ((charset (car method))
	(encoding (cdr method)))
    (concat "=?" charset "?" encoding "?"
	    (mime-encode-string
	     encoding
	     (if (fboundp 'convert-string-kanji-code) ;In case of NEmacs.
		 ;; Convert internal (EUC) to JIS code.
		 (convert-string-kanji-code string 3 2) string)
	     )
	    "?="
	    )))

(defun mime-voice-recorder-for-sun ()
  "Record voice in a buffer using Sun audio device, and return the buffer."
  (let ((buffer (get-buffer-create " *MIME audio*")))
    (message "Type C-g to finish recording...")
    (save-excursion
      (set-buffer buffer)
      (erase-buffer)
      (condition-case errorcode
	  (call-process "cat"
			"/dev/audio"
			buffer
			nil
			)
	(quit (message "Type C-g to finish recording... done.")
	      buffer			;Return the buffer
	      )))))


;;;
;;; Other useful commands.
;;;

;; Message forwarding commands as content-type "message/rfc822".
;; Usages are as follows:
;;
;;(setq rmail-mode-hook
;;      '(lambda ()
;;	 ;; Forward mail using MIME.
;;	 (require 'mime)
;;	 (substitute-key-definition 'rmail-forward
;;				    'mime-forward-from-rmail-using-mail
;;				    (current-local-map))
;;	 ))
;;
;;(setq gnus-mail-forward-method 'mime-forward-from-gnus-using-mail)
;;(setq gnus-summary-mode-hook
;;      '(lambda ()
;;	 ;; Forward article using MIME.
;;	 (require 'mime)
;;	 ))

(defun mime-forward-from-rmail-using-mail ()
  "Forward current message in message/rfc822 content-type message from rmail."
  (interactive)
  ;;>> this gets set even if we abort. Can't do anything about it, though.
  (rmail-set-attribute "forwarded" t)
  (let ((forward-buffer (current-buffer))
	(subject (concat "["
			 (mail-strip-quoted-names (mail-fetch-field "From"))
			 ": " (or (mail-fetch-field "Subject") "") "]")))
    ;; If only one window, use it for the mail buffer.
    ;; Otherwise, use another window for the mail buffer
    ;; so that the Rmail buffer remains visible
    ;; and sending the mail will get back to it.
    (if (if (one-window-p t)
	    (mail nil nil subject)
	  (mail-other-window nil nil subject))
	(save-excursion
	  (goto-char (point-max))
	  (forward-line 1)
	  (mime-insert-message "message" "rfc822")
	  (insert-buffer forward-buffer)))))

(defun mime-forward-from-gnus-using-mail ()
  "Forward current article in message/rfc822 content-type message from GNUS."
  (let ((forward-buffer (current-buffer))
	(subject
	 (concat "[" gnus-newsgroup-name "] "
		 ;;(mail-strip-quoted-names (gnus-fetch-field "From")) ": "
		 (or (gnus-fetch-field "Subject") ""))))
    ;; If only one window, use it for the mail buffer.
    ;; Otherwise, use another window for the mail buffer
    ;; so that the Rmail buffer remains visible
    ;; and sending the mail will get back to it.
    (if (if (one-window-p t)
	    (mail nil nil subject)
	  (mail-other-window nil nil subject))
	(save-excursion
	  (goto-char (point-max))
	  (mime-insert-message "message" "rfc822")
	  (insert-buffer forward-buffer)
	  ;; You have a chance to arrange the message.
	  (run-hooks 'gnus-mail-forward-hook)
	  ))))

(provide 'mime)

;;; mime.el ends here
