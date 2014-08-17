
(require 'my-pre)
(add-to-list 'load-path (expand-lang-path "slime/"))  ; your SLIME directory
(setq inferior-lisp-program "/usr/local/bin/clisp") ; your Lisp system
(require 'slime-autoloads)
(require 'slime)
(slime-setup)


(setq slime-lisp-implementations
	  '(
		(sbcl ("/usr/local/bin/sbcl") :coding-system utf-8-unix)
		(cmucl ("/usr/bin/cmucl") "-quite")
		(clisp ("/usr/local/bin/clisp") :coding-system utf-8-unix)
		(racket ("/usr/bin/racket") :coding-system utf-8-unix)
		(guile ("/usr/bin/guile") :coding-system utf-8-unix)
		(bigloo ("/usr/bin/bigloo") :coding-system utf-8-unix)
))


(require 'litable)

(defun my-emacs-lisp-mode-hook ()
  (local-set-key  (kbd "C-c C-e")  #'eval-buffer)
  (litable-mode)
  (local-set-key (kbd "C-c C-l") #'litable-accept-as-pure)
  )
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)

(provide 'my-lisp)


