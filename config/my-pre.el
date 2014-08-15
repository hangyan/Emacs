;;; ----------------------------------------------------------------------------
(defun is-in-terminal()
      (not (display-graphic-p)))

;;; ----------------------------------------------------------------------------
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive
   (progn
     (if (not (buffer-file-name))
         (error "Buffer '%s' is not visiting a file!" (buffer-name)))
     (list (read-file-name (format "Rename %s to: " (file-name-nondirectory
                                                     (buffer-file-name)))))))
  (if (equal new-name "")
      (error "Aborted rename"))
  (setq new-name (if (file-directory-p new-name)
                     (expand-file-name (file-name-nondirectory
                                        (buffer-file-name))
                                       new-name)
                   (expand-file-name new-name)))
  ;; If the file isn't saved yet, skip the file rename, but still update the
  ;; buffer name and visited file.
  (if (file-exists-p (buffer-file-name))
      (rename-file (buffer-file-name) new-name 1))
  (let ((was-modified (buffer-modified-p)))
    ;; This also renames the buffer, and works with uniquify
    (set-visited-file-name new-name)
    (if was-modified
        (save-buffer)
      ;; Clear buffer-modified flag caused by set-visited-file-name
      (set-buffer-modified-p nil))
	(message "Renamed to %s." new-name)))


;;; ----------------------------------------------------------------------------
; dash
;(add-to-list 'load-path "~/Emacs/dash")
(eval-after-load "dash" '(dash-enable-font-lock))

;;; ----------------------------------------------------------------------------
;package manager
(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;;; ----------------------------------------------------------------------------
; for view large pdfs
(defun my-find-file-check-make-large-file-read-only-hook ()
    "If a file is over a given size, make the buffer read only."
      (when (> (buffer-size) (* 1024 1024))
	    (setq buffer-read-only t)
	        (buffer-disable-undo)))

(add-hook 'find-file-hooks 'my-find-file-check-make-large-file-read-only-hook)


; urls
(global-set-key "\C-c\C-z." 'browse-url-at-point)
(global-set-key "\C-c\C-zb" 'browse-url-of-buffer)
(global-set-key "\C-c\C-zr" 'browse-url-of-region)
(global-set-key "\C-c\C-zu" 'browse-url)
(global-set-key "\C-c\C-zv" 'browse-url-of-file)
(add-hook 'dired-mode-hook
		  (lambda ()
            (local-set-key "\C-c\C-zf" 'browse-url-of-dired-file)))





(provide 'my-pre)
