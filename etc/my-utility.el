;;; Some Utility stuff.

(require 'my-pre)
;;;-----------------------------------------------------------------------------
;; tramp
(setq tramp-default-method "ssh")
(setq tramp-auto-save-directory "~/Emacs/data")
;;;-----------------------------------------------------------------------------
;; smart compile
(require 'smart-compile)
(global-set-key (kbd "<f9>") 'smart-compile)
(add-to-list 'smart-compile-alist 
             '("\\.scala\\'" . "scala -feature -deprecation %f"))
;;;-----------------------------------------------------------------------------
;; shell toggle
(require 'shell-toggle-patched)
(autoload 'shell-toggle "shell-toggle" t)
(autoload 'shell-toggle-cd "shell-toggle" t)
(global-set-key [f6] 'shell-toggle)
(global-set-key [C-f1] 'shell-toggle-cd)
;;;-----------------------------------------------------------------------------
;;;-----------------------------------------------------------------------------
;; ecb 
(add-to-list 'load-path (expand-utility-path "ecb/"))
;;(load-file (expand-utility-path "ecb/ecb.el"))
;; `make` first 
(require 'ecb)
;;(require 'ecb-autoloads)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

(global-set-key [f12] 'ecb-activate)
(global-set-key [C-f11] 'ecb-deactivate)
;;;-----------------------------------------------------------------------------
;; cmake  
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
            auto-mode-alist))
;; disbale abbrev mode
(setq-default abbrev-mode nil)
;;;-----------------------------------------------------------------------------
;;multi cursor
(add-to-list 'load-path (expand-utility-path "multiple-cursors"))
(require 'multiple-cursors)
(if (eq system-type 'gnu/linux)
    (progn
      (global-set-key (kbd "C-c C-S-c") 'mc/edit-lines)
      (global-set-key (kbd "C->") 'mc/mark-next-like-this)
      (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
      (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
      )
  (progn
    (global-set-key (kbd "C-c C-S-c") 'mc/edit-lines)
    (global-set-key (kbd "M-≥") 'mc/mark-next-like-this)
    (global-set-key (kbd "M-≤") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c M-≥") 'mc/mark-all-like-this)))
;;;-----------------------------------------------------------------------------
;; indent
;; (global-aggressive-indent-mode 1)
(auto-indent-global-mode)
;;;-----------------------------------------------------------------------------
;;; auto clean unused buffers
(require 'midnight)

;;kill buffers if they were last disabled more than this seconds ago
(setq clean-buffer-list-delay-special 900)

(defvar clean-buffer-list-timer nil
  "Stores clean-buffer-list timer if there is one. You can disable clean-buffer-list by (cancel-timer clean-buffer-list-timer).")

;; run clean-buffer-list every 2 hours
(setq clean-buffer-list-timer (run-at-time t 7200 'clean-buffer-list))

;; kill everything, clean-buffer-list is very intelligent at not killing
;; unsaved buffer.
(setq clean-buffer-list-kill-regexps '("^.*$"))

;; keep these buffer untouched
;; prevent append multiple times
(defvar clean-buffer-list-kill-never-buffer-names-init
  clean-buffer-list-kill-never-buffer-names
  "Init value for clean-buffer-list-kill-never-buffer-names")
(setq clean-buffer-list-kill-never-buffer-names
      (append
       '("*Messages*" "*cmd*" "*scratch*" "*w3m*" "*w3m-cache*")
       clean-buffer-list-kill-never-buffer-names-init))

;; prevent append multiple times
(defvar clean-buffer-list-kill-never-regexps-init
  clean-buffer-list-kill-never-regexps
  "Init value for clean-buffer-list-kill-never-regexps")
;; append to *-init instead of itself
(setq clean-buffer-list-kill-never-regexps
      (append '("^\\*EMMS Playlist\\*.*$")
              clean-buffer-list-kill-never-regexps-init))
;;;-----------------------------------------------------------------------------

(provide 'my-utility)

