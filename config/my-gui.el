;;; some sets of the apprence

(require 'my-pre)
(add-to-list 'load-path (expand-gui-path "misc"))


;-------------------------------------------------------------------------------
; set the window size / alpha
;(setq initial-frame-alist '((top . 0) (left . 250)(width . 110) (height . 40)))
(set-frame-parameter nil 'alpha '(100 100))
;-------------------------------------------------------------------------------
; common copy-cut-paste
;(cua-mode t)
;(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode t)
;(setq cua-keep-region-after-copy t)
;-------------------------------------------------------------------------------
; remove the startup infor
(setq initial-scratch-message nil)
(setq inhibit-splash-message t)
(setq inhibit-startup-message t)
;-------------------------------------------------------------------------------
; tool-bar 
(if window-system
    (tool-bar-mode 0))
;-------------------------------------------------------------------------------
; y-n replace yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)
;-------------------------------------------------------------------------------
; scroll bar 
(if window-system
    (scroll-bar-mode 0))
(customize-set-variable 'scroll-bar-mode 'right)
;-------------------------------------------------------------------------------
; Cursor
(setq-default cursor-type 'bar)
(smart-cursor-color-mode 1)
;-------------------------------------------------------------------------------
; Major mode 
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;-------------------------------------------------------------------------------
; Indent tab
(setq-default tab-width 4)
(setq indent-line-funtion 'insert-tab)

(setq require-final-newline t)

(setq-default indent-tabs-mode t)
(add-hook 'lisp-mode-hook '(lambda ()
		    (local-set-key (kbd "RET") 'newline-and-indent)))

(define-key global-map (kbd "RET") 'newline-and-indent)
;-------------------------------------------------------------------------------
; Backup
(setq auto-save-default nil)
(setq-default make-backup-files nil)
;-------------------------------------------------------------------------------
; Mode Line
(display-time-mode 1)
(setq display-time-day-and-date t)
(setq display-time-interval 10)

(add-to-list 'load-path (expand-gui-path "smart-mode-line"))
(require 'smart-mode-line)
(sml/setup)
(sml/apply-theme 'dark)
;-------------------------------------------------------------------------------
; Parentheses 
(require 'paren)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

(require 'highlight-parentheses)

(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(add-to-list 'load-path (expand-gui-path "smartparens"))
(require 'smartparens-config)
(smartparens-global-mode 1)
;-------------------------------------------------------------------------------
; Line/column number
(when (display-graphic-p)
     (require 'linum)
     (global-linum-mode t))

(setq column-number-mode t)
;-------------------------------------------------------------------------------
; Theme
(when (display-graphic-p)
    (add-to-list 'custom-theme-load-path (expand-gui-path "themes/")))
;    (add-to-list 'custom-theme-load-path "~/Emacs/utility/themes/bubbleberry")

(load-theme 'noctilux t)
;(load "~/Emacs/utility/themes/color-theme-molokai.el")
;(color-theme-molokai)
;(set-frame-parameter nil 'alpha '(100 50))
;-------------------------------------------------------------------------------
; Terminal settings
(when (is-in-terminal)
    (require 'lacarte)
    (global-set-key [?\e ?\M-x] 'lacarte-execute-command)
    (global-set-key [?\M-`] 'lacarte-execute-command))
;-------------------------------------------------------------------------------
; Right margin
(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(setq fci-rule-color "blue")
(setq fci-rule-use-dashes t)
(setq fci-rule-width 1)
(setq fci-rule-color "red")
(add-hook 'after-change-major-mode-hook 'fci-mode)
;-------------------------------------------------------------------------------
; Indent guide
(require 'indent-guide)
(indent-guide-global-mode)
;(set-face-background 'indent-guide-face "dimgray")
(setq indent-guide-char "|")
;-------------------------------------------------------------------------------
; Buffers
(global-set-key (kbd "\C-x\C-b") 'buffer-menu-other-window)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

(setq inhibit-default-init t)

(setq-default frame-title-format "%b (%f)")
;-------------------------------------------------------------------------------
; Recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;-------------------------------------------------------------------------------
; Neotree 
(require 'neotree)
(global-set-key [f5] 'neotree-toggle)
;-------------------------------------------------------------------------------
; Minimap
;-------------------------------------------------------------------------------
; Smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;-- This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;-------------------------------------------------------------------------------
; Utilitys
(setq enable-recursive-minibuffers t) ;; allow recursive editing in minibuffer
(follow-mode t)                       ;; follow-mode allows easier editing of long files
;-------------------------------------------------------------------------------


(provide 'my-gui)
