
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(setq user-emacs-directory "~/Emacs")
(add-to-list 'load-path "~/Emacs")
(add-to-list 'load-path "~/Emacs/config")
(add-to-list 'load-path "~/Emacs/misc")

;;; Settings need to be load first
(setq custom-file "~/Emacs/custom.el")
(load custom-file)
;;(autoload 'esup "esup" "Emacs Start Up Profiler." nil)

(require 'yayu) ;; custom functions
(require 'my-pre)
(require 'my-gui)
(require 'my-auto-complete)
(require 'my-helm)
(require 'my-util)
(require 'my-lang)
(require 'my-elisp)
(require 'my-golang)
(require 'my-python)
(require 'after)

;;(require 'my-scala)
;;(require 'my-cc)
;;(require 'my-lisp)
;;(require 'my-web)


