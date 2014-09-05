 
;;; some sets of the apprence

(require 'my-pre)

(add-to-list 'load-path (expand-gui-path "misc"))
(add-to-list 'load-path (expand-gui-path "smartparens"))
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
; tool-bar  menu-bar
(if window-system
    (tool-bar-mode 0))
(global-set-key [f3] 'menu-bar-open)
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
;(load-theme 'noctilux t)
(add-to-list 'custom-theme-load-path (expand-gui-path "themes/solarized"))
;(load-theme 'solarized-light t)
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
(global-set-key [f4] 'neotree-toggle)
;-------------------------------------------------------------------------------
; Nav
(add-to-list 'load-path (expand-gui-path "nav"))
(require 'nav)
(nav-disable-overeager-window-splitting)
;-------------------------------------------------------------------------------
; window golden ratio
;(require 'golden-ratio)
;(golden-ratio-mode 1)
;-------------------------------------------------------------------------------
; Utilitys
(setq enable-recursive-minibuffers t) ;; allow recursive editing in minibuffer
(follow-mode t)                       ;; follow-mode allows easier editing of long files
;-------------------------------------------------------------------------------
; Major mode 
(setq major-mode 'text-mode)
(add-hook 'text-mode-hook
  '(lambda()
	 (turn-on-auto-fill)
     (set-fill-column 80)))
;-------------------------------------------------------------------------------
; resize windows
;(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
;(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
;-------------------------------------------------------------------------------
; Font for linux
(if (eq system-type 'gnu/linux)
    (progn
      (add-to-list 'default-frame-alist '(font .  "Droid Sans Mono-10" ))
      (set-face-attribute 'default t :font  "Droid Sans Mono-10")
      ))
;-------------------------------------------------------------------------------
; popup winow
;(require 'popwin)
;(popwin-mode 1)
;-------------------------------------------------------------------------------
(provide 'my-gui)
