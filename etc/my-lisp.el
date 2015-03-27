
(require 'my-pre)
(add-to-list 'load-path (expand-lang-path "slime/"))  ; your SLIME directory
(setq inferior-lisp-program "/usr/local/bin/clisp") ; your Lisp system
(require 'slime-autoloads)


(setq slime-lisp-implementations
	  '(
		(sbcl ("/usr/local/bin/sbcl") :coding-system utf-8-unix)
		(cmucl ("/usr/bin/cmucl") "-quite")
		(clisp ("/usr/local/bin/clisp") :coding-system utf-8-unix)
		(racket ("/usr/bin/racket") :coding-system utf-8-unix)
		(guile ("/usr/bin/guile") :coding-system utf-8-unix)
		(bigloo ("/usr/bin/bigloo") :coding-system utf-8-unix)
		))



(defun my-emacs-lisp-mode-hook ()
  (local-set-key  (kbd "C-c C-v")  #'eval-buffer)
  )
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)


(add-to-list 'load-path (expand-lang-path "lisp"))
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)

										; copy from yinwang.
(require 'cmuscheme)
(setq scheme-program-name "petite")         ;; 如果用 Petite 就改成 "petite"


;; bypass the interactive question and start the default interpreter
(defun scheme-proc ()
  "Return the current Scheme process, starting one if necessary."
  (unless (and scheme-buffer
               (get-buffer scheme-buffer)
               (comint-check-proc scheme-buffer))
    (save-window-excursion
      (run-scheme scheme-program-name)))
  (or (scheme-get-process)
      (error "No current process. See variable `scheme-buffer'")))


(defun scheme-split-window ()
  (cond
   ((= 1 (count-windows))
    (delete-other-windows)
    (split-window-vertically (floor (* 0.68 (window-height))))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window 1))
   ((not (find "*scheme*"
               (mapcar (lambda (w) (buffer-name (window-buffer w)))
                       (window-list))
               :test 'equal))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window -1))))


(defun scheme-send-last-sexp-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-last-sexp))


(defun scheme-send-definition-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-definition))

(add-hook 'scheme-mode-hook
		  (lambda ()
			(paredit-mode 1)
			(define-key scheme-mode-map (kbd "<f5>") 'scheme-send-last-sexp-split-window)
			(define-key scheme-mode-map (kbd "<f6>") 'scheme-send-definition-split-window)))




(provide 'my-lisp)


