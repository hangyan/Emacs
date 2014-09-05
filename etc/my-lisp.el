
(require 'my-pre)
(add-to-list 'load-path (expand-lang-path "slime/"))  ; your SLIME directory
(setq inferior-lisp-program "/usr/local/bin/clisp") ; your Lisp system
(require 'slime-autoloads)
;(require 'slime)
;(slime-setup)


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
;-------------------------------------------------------------------------------
; racket
;; (add-to-list 'load-path (expand-lang-path "racket"))
;; (autoload 'racket-mode "racket-mode.el"
;;   "Major mode for editing racket files" t)
;; (add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

;; (add-hook 'racket-mode-hook
;;           '(lambda ()
;;              (define-key racket-mode-map (kbd "C-c r") 'racket-run)))
;-------------------------------------------------------------------------------
; geiser
(add-to-list 'load-path (expand-lang-path "geiser"))
(load (expand-lang-path "geiser/elisp/geiser-load"))
;-------------------------------------------------------------------------------
; quack
(add-to-list 'load-path (expand-lang-path "quack"))
(require 'quack)
;-------------------------------------------------------------------------------


(provide 'my-lisp)


