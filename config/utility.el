;;; Some Utility stuff.

; yasnippet
(add-to-list 'load-path "~/Emacs/yasnippet/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/Emacs/yasnippet/yasnippet/snippets")
;-------------------------------------------------------------------------------
; git
(add-to-list 'load-path "~/Emacs/git-emacs")
(require 'git-emacs)
;-------------------------------------------------------------------------------
; gnuplot
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))
;-------------------------------------------------------------------------------
; tramp
(setq tramp-default-method "ssh")
;-------------------------------------------------------------------------------
; rainbow
(add-to-list 'auto-mode-alist '("\\.css\\'" . rainbow-mode))
;-------------------------------------------------------------------------------
; smart compile
(require 'smart-compile)
(global-set-key (kbd "<f9>") 'smart-compile)
;-------------------------------------------------------------------------------
; shell toggle
(require 'shell-toggle-patched)
(autoload 'shell-toggle "shell-toggle" t)
(autoload 'shell-toggle-cd "shell-toggle" t)
(global-set-key [f3] 'shell-toggle)
(global-set-key [C-f1] 'shell-toggle-cd)
;-------------------------------------------------------------------------------
; mutt 
(autoload 'muttrc-mode "muttrc-mode.el" 
	  "Major mode to edit muttrc files" t)
(setq auto-mode-alist 
      (append '(("muttrc\\'" . muttrc-mode))
	     auto-mode-alist))
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
;-------------------------------------------------------------------------------
; template  
(require 'template)
(template-initialize)
;-------------------------------------------------------------------------------
; ecb 
(add-to-list 'load-path "~/Emacs/ecb/")
(load-file "~/Emacs/ecb/ecb.el")
(require 'ecb)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

(global-set-key [f12] 'ecb-activate)
(global-set-key [C-f11] 'ecb-deactivate)
;-------------------------------------------------------------------------------
; cmake  
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
            auto-mode-alist))
;-------------------------------------------------------------------------------
; tree-mode
(require 'tree-mode)
(require 'windata)
(require 'dirtree)
;-------------------------------------------------------------------------------
; hacknews
(require 'hackernews)
;-------------------------------------------------------------------------------
; tpp
(autoload 'tpp-mode "tpp-mode" "TPP mode." t)
(add-to-list 'auto-mode-alist '("\\.tpp$" . tpp-mode))
(setq tpp-command     "xterm -e tpp")
(setq tpp-helpcommand "cat /usr/local/share/doc/tpp/README  | xless")
;-------------------------------------------------------------------------------
; very large files
(add-to-list 'load-path "~/Emacs/vlfi")
(require 'vlf-integrate)
;-------------------------------------------------------------------------------
; calendar
(add-to-list 'load-path "~/Emacs/calfw")
(require 'calfw)
;-------------------------------------------------------------------------------
;w3m
(add-to-list 'load-path "~/Emacs/w3m")
(add-to-list 'load-path "~/Emacs/APEL")
(add-to-list 'load-path "~/Emacs/mit")
(require 'w3m-load)
;-------------------------------------------------------------------------------
; disbale abbrev mode
(setq-default abbrev-mode nil)
;-------------------------------------------------------------------------------


(provide 'utility)
