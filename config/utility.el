

;cocci-grep
(require 'cocci-grep)





;sr-speedbar
(require 'sr-speedbar)
(global-set-key [f5] 'sr-speedbar-toggle)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-auto-refresh t)
(setq sr-speedbar-skip-other-window-p t)


;yasnippet
;-----------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/yasnippet/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet/yasnippet/snippets")



;git
(add-to-list 'load-path "~/.emacs.d/git-emacs")
(require 'git-emacs)


;;--------------------------------------------------------------------
;; Lines enabling gnuplot-mode

;; move the files gnuplot.el to someplace in your lisp load-path or
;; use a line like
 ; (setq load-path (append (list "/usr/share/emacs/site-lisp/") load-path))

;; these lines enable the use of gnuplot mode
  (autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
  (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

;; this line automatically causes all files with the .gp extension to
;; be loaded into gnuplot mode
  (setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;; This line binds the function-9 key so that it opens a buffer into
;; gnuplot mode 
;  (global-set-key [(f9)] 'gnuplot-make-buffer)

;; end of line for gnuplot-mode
;;--------------------------------------------------------------------
;;
;;
;;



;;tramp
;;for edit remote files
;(add-to-list 'load-path "~/.emacs.d/tramp/lisp")
;(add-to-list 'Info-default-directory-list "~/.emacs.d/tramp/info")
;(require 'tramp)
(setq tramp-default-method "ssh")



;package
(when (>= emacs-major-version 24)
    (require 'package)
      (package-initialize)
        (add-to-list 'package-archives 
		     '("melpa" . "http://melpa.milkbox.net/packages/") t)
	(add-to-list 'package-archives 
		     '("marmalade" . "http://marmalade-repo.org/packages/"))
	  )


;rainbow
(add-to-list 'auto-mode-alist '("\\.css\\'" . rainbow-mode))

;smart compile
(require 'smart-compile)
(global-set-key (kbd "<f9>") 'smart-compile)


;shell toggle
(require 'shell-toggle-patched)
(autoload 'shell-toggle "shell-toggle" t)
(autoload 'shell-toggle-cd "shell-toggle" t)
(global-set-key [f3] 'shell-toggle)
(global-set-key [C-f1] 'shell-toggle-cd)

;awk
(require 'awk-it)


;vs project
(require 'project-buffer-mode)
(autoload 'find-sln "sln-mode")


(require 'package)
(add-to-list 'package-archives
	                  '("melpa" . "http://melpa.milkbox.net/packages/") t)


;gnuplot
;(require 'gnuplot-mode)
;(append '(("\\.\\(gp\\|gnuplot\\)$" . gnuplot-mode)) auto-mode-alist)
;---use melpa

;ledger
(add-to-list 'load-path
	     (expand-file-name "~/.emacs.d/ledger"))
(load "ledger-mode")
(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))


;fcitx
(global-set-key (kbd "C-SPC") nil)


;predictive
(add-to-list 'load-path "~/.emacs.d/predictive/")
(add-to-list 'load-path "~/.emacs.d/predictive/latex/")
(add-to-list 'load-path "~/.emacs.d/predictive/html/")
(add-to-list 'load-path "~/.emacs.d/predictive/texinfo/")
(require 'predictive)



(provide 'utility)
