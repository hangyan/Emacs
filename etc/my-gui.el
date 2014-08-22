 
;;; some sets of the apprence

(require 'my-pre)
(add-to-list 'load-path (expand-gui-path "misc"))


;-------------------------------------------------------------------------------
; set the window size / alpha
;(setq initial-frame-alist '((top . 0) (left . 250)(width . 110) (height . 40)))
(set-frame-parameter nil 'alpha '(100 100))
;(custom-set-variables
; '(initial-frame-alist (quote ((fullscreen . maximized)))))
(require 'frame-cmds)
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
; windows manager
(add-to-list 'load-path (expand-gui-path "emacs-window-manager"))
(require 'e2wm)
(global-set-key (kbd "M-+") 'e2wm:start-management)
;-------------------------------------------------------------------------------
; menu bar +
 (eval-after-load "menu-bar" '(require 'menu-bar+))
;-------------------------------------------------------------------------------
; frame commands

(require 'frame-cmds)
; Don't know why var menu-bar-frames-menu should provide by menu-bar+.
(define-key menu-bar-frames-menu [separator-frame-2] '("--"))
(define-key menu-bar-frames-menu [toggle-max-frame-vertically]
  '(menu-item "Toggle Max Frame Vertically" toggle-max-frame-vertically
              :help "Maximize or restore the selected frame vertically"
              :enable (frame-parameter nil 'restore-height)))
(define-key menu-bar-frames-menu [toggle-max-frame-horizontally]
  '(menu-item "Toggle Max Frame Horizontally" toggle-max-frame-horizontally
              :help "Maximize or restore the selected frame horizontally"
              :enable (frame-parameter nil 'restore-width)))
(define-key menu-bar-frames-menu [toggle-max-frame]
  '(menu-item "Toggle Max Frame" toggle-max-frame
              :help "Maximize or restore the selected frame (in both directions)"
              :enable (or (frame-parameter nil 'restore-width) (frame-parameter nil 'restore-height))))
(define-key menu-bar-frames-menu [maximize-frame-vertically]
  '(menu-item "Maximize Frame Vertically" maximize-frame-vertically
              :help "Maximize the selected frame vertically"))
(define-key menu-bar-frames-menu [maximize-frame-horizontally]
  '(menu-item "Maximize Frame Horizontally" maximize-frame-horizontally
              :help "Maximize the selected frame horizontally"))
(define-key menu-bar-frames-menu [maximize-frame]
  '(menu-item "Maximize Frame" maximize-frame
              :help "Maximize the selected frame (in both directions)"))
(define-key menu-bar-frames-menu [separator-frame-3] '("--"))
(define-key menu-bar-frames-menu [iconify-everything]
  '(menu-item "Iconify All Frames" iconify-everything
              :help "Iconify all frames of session at once"))
(define-key menu-bar-frames-menu [show-hide]
  '(menu-item "Hide Frames / Show Buffers" show-hide
              :help "Show, if only one frame visible; else hide."))

;-------------------------------------------------------------------------------
; Major mode 
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook
  '(lambda()
	 (turn-on-auto-fill)
	 (set-fill-column 80)))
;-------------------------------------------------------------------------------
; Font for linux
(if (eq system-type 'gnu/linux)
    (progn
      (add-to-list 'default-frame-alist '(font .  "Droid Sans Mono-10" ))
      (set-face-attribute 'default t :font  "Droid Sans Mono-10")
      ))


;-------------------------------------------------------------------------------
(provide 'my-gui)
