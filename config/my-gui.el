
;;some sets of the apprence

;set the window size
(setq initial-frame-alist '((top . 0) (left . 250)(width . 110) (height . 40)))

;common copy-cut-paste
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode 1)
(setq cua-keep-region-after-copy t)

;remove the startup infor
(setq initial-scratch-message nil)
(setq inhibit-splash-message t)
(setq inhibit-startup-message t)

;remove the tool bar
(if window-system
    (tool-bar-mode 0))
(if window-system
    (scroll-bar-mode 0))
(setq-default cursor-type 'bar)

;y-n replace yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)

;scroll bar at right 
(customize-set-variable 'scroll-bar-mode 'right)

(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-funtion 'insert-tab)

;backup
(setq auto-save-default nil)
(setq-default make-backup-files nil)

;end with newline 
(setq require-final-newline t)

;show time 
(display-time-mode 1)
(setq display-time-day-and-date t)
(setq display-time-interval 10)
(setq display-time-use-mail-icon t)

;parentheses match
(show-paren-mode t)
(setq show-paren-style 'parentheses)


;open image
(auto-image-file-mode)
(setq w3m-default-display-inline-images t)
;(require 'thumbs)

;show line number
;(require 'linum)
;(global-linum-mode t)




(setq column-number-mode t)

;theme
;Note: will be overwrite by later settings
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'zenburn t)
;(load-theme 'Amelie)
;(load-theme 'tango-dark t)
;(load-theme 'monokai t)
;(load "~/.emacs.d/themes/color-theme-molokai.el")
;(color-theme-molokai)
;(set-frame-parameter nil 'alpha '(100 50))


;in terminal
(require 'lacarte)
(global-set-key [?\e ?\M-x] 'lacarte-execute-command)
(global-set-key [?\M-`] 'lacarte-execute-command)


;abbrev file
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)
(quietly-read-abbrev-file)
(setq default-abbrev-mode t)

;indent
(setq-default indent-tabs-mode t)
(add-hook 'lisp-mode-hook '(lambda ()
		    (local-set-key (kbd "RET") 'newline-and-indent)))

(define-key global-map (kbd "RET") 'newline-and-indent)

;right margin
(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(setq fci-rule-color "blue")
(setq fci-rule-use-dashes t)
(setq fci-rule-width 1)
(setq fci-rule-color "red")
(add-hook 'after-change-major-mode-hook 'fci-mode)

;indent guide
(require 'indent-guide)
(indent-guide-global-mode)
;(set-face-background 'indent-guide-face "dimgray")
(setq indent-guide-char "|")


;buffers
(global-set-key (kbd "\C-x\C-b") 'buffer-menu-other-window)





(set-frame-parameter nil 'alpha '(100 100))

(provide 'my-gui)
