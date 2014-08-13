(add-to-list 'load-path "~/Emacs/slime/")  ; your SLIME directory
(setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
(require 'slime-autoloads)
(require 'slime)
(slime-setup)


(setq slime-lisp-implementations
	  '(
		(sbcl ("/usr/bin/sbcl") :coding-system utf-8-unix)
		(cmucl ("/usr/bin/cmucl") "-quite")
		(clisp ("/usr/bin/clisp") :coding-system utf-8-unix)
		(racket ("/usr/bin/racket") :coding-system utf-8-unix)
		(guile ("/usr/bin/guile") :coding-system utf-8-unix)
		(bigloo ("/usr/bin/bigloo") :coding-system utf-8-unix)
))


(provide 'my-lisp)
