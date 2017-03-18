
;;; some sets of the apprence

;;------------------------------------------------------------------------------
(require 'my-pre)

(transient-mark-mode t)
;;-------------------------------------------------------------------------------
;; remove the startup infor
(setq initial-scratch-message nil
	  inhibit-splash-message t
	  inhibit-startup-message t)
;;-------------------------------------------------------------------------------
;; tool-bar  menu-bar
(if window-system
    (tool-bar-mode 0))
(global-set-key [f3] 'menu-bar-open)
;;-------------------------------------------------------------------------------
;; y-n replace yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)
;;-------------------------------------------------------------------------------
;; scroll bar 
(if window-system
    (scroll-bar-mode 0))
(customize-set-variable 'scroll-bar-mode 'right)
;;-------------------------------------------------------------------------------
;; Cursor
(setq-default cursor-type 'bar)
;;-------------------------------------------------------------------------------
;; Indent tab
(setq-default tab-width 4)
(setq indent-line-funtion 'insert-tab)

(setq require-final-newline t)

(setq-default indent-tabs-mode t)
(infer-indentation-style)
;;-------------------------------------------------------------------------------
;; Backup
(setq auto-save-default nil)
(setq-default make-backup-files nil)
;;-------------------------------------------------------------------------------
;; Parentheses 
(require 'paren)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

(require 'highlight-parentheses)

(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)


(require 'smartparens-config)
(show-smartparens-global-mode t)
(smartparens-global-mode 1)

;;-------------------------------------------------------------------------------
;; Line/column number
(when (display-graphic-p)
  (require 'linum)
  (global-linum-mode t))

(setq column-number-mode t)
;;-------------------------------------------------------------------------------
;; Terminal settings
(when (is-in-terminal)
  (require 'lacarte)
  (global-set-key [?\e ?\M-x] 'lacarte-execute-command)
  (setq global-hl-line-mode nil)
  (global-set-key [?\M-`] 'lacarte-execute-command))
;;-------------------------------------------------------------------------------
;; Right margin
;;(require 'fill-column-indicator)
;;(setq-default fci-rule-column 100)
;;(setq fci-rule-color "blue")
;;(setq fci-rule-use-dashes t)
;;(setq fci-rule-width 1)
;;(setq fci-rule-color "red")
;;(add-hook 'after-change-major-mode-hook 'fci-mode)
;;-------------------------------------------------------------------------------
;; Indent guide
;;(require 'indent-guide)
;;(indent-guide-global-mode)
;;(set-face-background 'indent-guide-face "dimgray")
;;(setq indent-guide-char "|")
;;-------------------------------------------------------------------------------
;; Buffers
(global-set-key (kbd "\C-x\C-b") 'buffer-menu-other-window)
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq inhibit-default-init t)
(setq-default frame-title-format "%b (%f)")


;; kpm-list : switch buffers
;;(require 'kpm-list)

;; uniquify : buffer names uniq
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "C-c t") 'untabify)
;;-------------------------------------------------------------------------------
;; Recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;-------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------

;; Utilitys
(setq enable-recursive-minibuffers t) ;; allow recursive editing in minibuffer
(follow-mode t)                       ;; follow-mode allows easier editing of long files
;;-------------------------------------------------------------------------------
;; Major mode 
(setq major-mode 'text-mode)
(add-hook 'text-mode-hook
		  '(lambda()
			 (turn-on-auto-fill)
			 (set-fill-column 100)))

(global-auto-revert-mode t)
;;-------------------------------------------------------------------------------
;; indent
;; (auto-indent-global-mode)
;;------------------------------------------------------------------------------
;; lines
(setq-default truncate-lines t)
(global-set-key (kbd "C-n")
                (lambda () (interactive) (next-line 5)))

(global-set-key (kbd "C-p")
                (lambda () (interactive) (previous-line 5)))

(add-hook 'lisp-mode-hook '(lambda ()
                             (local-set-key (kbd "RET") 'newline-and-indent)))
(define-key global-map (kbd "RET") 'newline-and-indent)

;; bookmark
;; Put Last-Selected Bookmark on Top
(defadvice bookmark-jump (after bookmark-jump activate)
  (let ((latest (bookmark-get-bookmark bookmark)))
    (setq bookmark-alist (delq latest bookmark-alist))
    (add-to-list 'bookmark-alist latest)))

;;------------------------------------------------------------------------------
;; windows movement
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
;;------------------------------------------------------------------------------
;; buffer move
(require 'buffer-move)
(global-set-key (kbd "<C-S-up>") 'buf-move-up)
(global-set-key (kbd "<C-S-down>") 'buf-move-down)
(global-set-key (kbd "<C-S-left>") 'buf-move-left)
(global-set-key (kbd "<C-S-right>") 'buf-move-right)
;;------------------------------------------------------------------------------
;; mac keys
(defvar *my-previous-buffer* t
  "can we switch?")

(defun my-previous-buffer ()
  (interactive)
  (message "custom prev: *my-previous-buffer*=%s" *my-previous-buffer*)
  (when *my-previous-buffer*
    (previous-buffer)
    (setq *my-previous-buffer* nil)
    (run-at-time "1 sec" nil (lambda ()
                               (setq *my-previous-buffer* t)))))

(defvar *my-next-buffer* t
  "can we switch?")

(defun my-next-buffer ()
  (interactive)
  (message "custom prev: *my-next-buffer*=%s" *my-next-buffer*)
  (when *my-next-buffer*
    (next-buffer)
    (setq *my-next-buffer* nil)
    (run-at-time "1 sec" nil (lambda ()
                               (setq *my-next-buffer* t)))))

(global-set-key [triple-wheel-right] 'my-previous-buffer)
(global-set-key [triple-wheel-left] 'my-next-buffer)

;; smooth scrolling
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 2) ;; keyboard scroll one line at a time


;;
;;(smart-mode-line-enable)
(provide 'my-gui)
