; cocci-grep  
(require 'cocci-grep)

; sr-speedbar  
;(require 'sr-speedbar)
;(global-set-key [f5] 'sr-speedbar-toggle)
;(setq sr-speedbar-right-side nil)
;(setq sr-speedbar-auto-refresh t)
;(setq sr-speedbar-skip-other-window-p t)

; yasnippet 
(add-to-list 'load-path "~/.emacs.d/yasnippet/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet/yasnippet/snippets")

; git
(add-to-list 'load-path "~/.emacs.d/git-emacs")
(require 'git-emacs)

; gnuplot
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))




; tramp
;for edit remote files
;(add-to-list 'load-path "~/.emacs.d/tramp/lisp")
;(add-to-list 'Info-default-directory-list "~/.emacs.d/tramp/info")
;(require 'tramp)

(setq tramp-default-method "ssh")


; package
(when (>= emacs-major-version 24)
    (require 'package)
      (package-initialize)
        (add-to-list 'package-archives 
		     '("melpa" . "http://melpa.milkbox.net/packages/") t)
	(add-to-list 'package-archives 
		     '("marmalade" . "http://marmalade-repo.org/packages/"))
	  )


; rainbow
(add-to-list 'auto-mode-alist '("\\.css\\'" . rainbow-mode))


; smart compile
(require 'smart-compile)
(global-set-key (kbd "<f9>") 'smart-compile)

; shell toggle
(require 'shell-toggle-patched)
(autoload 'shell-toggle "shell-toggle" t)
(autoload 'shell-toggle-cd "shell-toggle" t)
(global-set-key [f3] 'shell-toggle)
(global-set-key [C-f1] 'shell-toggle-cd)


; awk  
(require 'awk-it)


; fcitx 
(global-set-key (kbd "C-SPC") nil)



; mutt 
(autoload 'muttrc-mode "muttrc-mode.el" 
	  "Major mode to edit muttrc files" t)
(setq auto-mode-alist 
      (append '(("muttrc\\'" . muttrc-mode))
	     auto-mode-alist))

(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

; tiny-tools
(add-to-list 'load-path "~/emacs.d/tiny-tools/lisp/tiny")
(add-to-list 'load-path "~/emacs.d/tiny-tools/lisp/other")

; template  
(require 'template)
(template-initialize)

; ecb 
(add-to-list 'load-path "~/.emacs.d/ecb/")
(load-file "~/.emacs.d/ecb/ecb.el")
(require 'ecb)



(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)


(global-set-key [f12] 'ecb-activate)
(global-set-key [C-f11] 'ecb-deactivate)
;;;----------------------------------------


; hl-spotlight  
;(require 'hl-spotlight)
;(global-hl-spotlight-mode)


; cursor-chg 
;(require 'cursor-chg)            ; Load the library
;(toggle-cursor-type-when-idle 1) ; Turn on cursor change when Emacs is idle
;(change-cursor-mode 1)           ; Turn on change for overwrite, read-only, and input mode


; cmake  
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
            auto-mode-alist))

; present
;(require 'epresent)

; tree-mode
(require 'tree-mode)
(require 'windata)
(require 'dirtree)

; hacknews
(require 'hackernews)

; 2048
;(load-library '2048)

; doubanfm
 (autoload 'douban-music "douban-music-mode" nil t)

; tpp
(autoload 'tpp-mode "tpp-mode" "TPP mode." t)
(add-to-list 'auto-mode-alist '("\\.tpp$" . tpp-mode))
(setq tpp-command     "xterm -e tpp")
(setq tpp-helpcommand "cat /usr/local/share/doc/tpp/README  | xless")



(provide 'utility)
