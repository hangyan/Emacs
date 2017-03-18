;;; Some Utility stuff.

(require 'my-pre)
(require 'yayu)
;;-----------------------------------------------------------------------------
;; tramp
;;(setq tramp-default-method "ssh")
;;(setq tramp-auto-save-directory "~/Emacs/data")
;;-----------------------------------------------------------------------------
;; smart compile
(require 'smart-compile)
(add-to-list 'smart-compile-alist 
             '("\\.scala\\'" . "scala -feature -deprecation %f"))
(add-to-list 'smart-compile-alist
             '("\\.rs\\'" . "rustc %f"))
(add-to-list 'smart-compile-alist
             '("Cargo\\.toml\\'" . "cargo build"))
(add-to-list 'smart-compile-alist
			 '("\\.py\\'" . "python %f"))
(global-set-key (kbd "C-x j") 'smart-compile)
;;-----------------------------------------------------------------------------
;; shell toggle
(require 'shell-toggle-patched)
(autoload 'shell-toggle "shell-toggle" t)
(autoload 'shell-toggle-cd "shell-toggle" t)
(global-set-key [C-f1] 'shell-toggle-cd)
;;-----------------------------------------------------------------------------
;; ecb 
;; (add-to-list 'load-path (expand-util-path "ecb/"))
;; ;;(load-file (expand-util-path "ecb/ecb.el"))
;; ;; `make` first 
;; (require 'ecb)
;; ;;(require 'ecb-autoloads)
;; (global-set-key (kbd "C-x <up>") 'windmove-up)
;; (global-set-key (kbd "C-x <down>") 'windmove-down)
;; (global-set-key (kbd "C-x <right>") 'windmove-right)
;; (global-set-key (kbd "C-x <left>") 'windmove-left)

;; (global-set-key (kbd "C-c b a") 'ecb-activate)
;; (global-set-key (kbd "C-c b d") 'ecb-deactivate)



;;-----------------------------------------------------------------------------
;; cmake  
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
            auto-mode-alist))
;; disbale abbrev mode
(setq-default abbrev-mode nil)
;;-----------------------------------------------------------------------------
;;multi cursor
;; (add-to-list 'load-path (expand-util-path "multiple-cursors"))
;; (require 'multiple-cursors)

;; (if (eq system-type 'gnu/linux)
;;     (progn
;;       (global-set-key (kbd "C-c C-S-c") 'mc/edit-lines)
;;       (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;       (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;       (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;;       )
;;   (progn
;;     (global-set-key (kbd "C-c C-S-c") 'mc/edit-lines)
;;     (global-set-key (kbd "M-≥") 'mc/mark-next-like-this)
;;     (global-set-key (kbd "M-≤") 'mc/mark-previous-like-this)
;;     (global-set-key (kbd "C-c M-≥") 'mc/mark-all-like-this)))

;;-----------------------------------------------------------------------------
;; RSS
;; (setq elfeed-feeds
;;       '(
;;         "http://blog.docker.com/feed/"
;;         "http://nullprogram.com/feed/"
;;         "http://blog.jobbole.com/feed/"
;;         "http://www.tedunangst.com/flak/rss"
;;         "http://rss.aqee.net/"
;;         "http://blog.sina.com.cn/rss/1286528122.xml"
;;         "http://coolshell.cn/feed"))
;;-----------------------------------------------------------------------------
;; popwin
;;(require 'popwin)
;;(popwin-mode 1)
;;(global-set-key (kbd "C-z") popwin:keymap)
;; see https://github.com/emacs-jp/issues/issues/2
;;(setq popwin:close-popup-window-timer-interval 0.05)
;;(setq display-buffer-function 'popwin:display-buffer)
;;(push '("^\*compilation.+\*$" :regexp t) popwin:special-display-config)
;;(push '("^\*[Hh]elm.+\*$" :regexp t) popwin:special-display-config)
;;(push '("^\*cscope\*$" :regexp t) popwin:special-display-config)
;;(push '("^\*Shell\ Command\ Output.+\*$" :regexp t) popwin:special-display-config)
;; midnight


(require 'midnight)
;; temp buffer
;;(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
;;(add-hook 'compilation-mode-hook 'turn-on-tempbuf-mode)
;;(add-hook 'custom-mode-hook 'turn-on-tempbuf-mode)
;;(add-hook 'help-mode-hook 'turn-on-tempbuf-mode)
;;(add-hook 'recentf-dialog-mode-hook 'turn-on-tempbuf-mode)
;;(add-hook 'special-mode-hook 'turn-on-tempbuf-mode)
;;(add-hook 'buffer-menu-mode-hook 'turn-on-tempbuf-mode)
;;(add-hook 'Info-mode-hook 'turn-on-tempbuf-mode)
;;(add-hook 'debugger-mode-hook 'turn-on-tempbuf-mode)
;; kill buffers function
(require 'cl)
(defun bk-kill-buffers (regexp)
  "Kill buffers matching REGEXP without asking for confirmation."
  (interactive "sKill buffers matching this regular expression: ")
  (cl-flet ((kill-buffer-ask (buffer) (kill-buffer buffer)))
    (kill-matching-buffers regexp)))

(add-hook 'tempbuf-mode-hook
          (lambda ()
            (bk-kill-buffers "\\*[Hh]elm.*\\*")
            (bk-kill-buffers "\\*markdown-output\\*")
            (bk-kill-buffers "\\*Shell.*Command.*Output.*\*")
            (bk-kill-buffers "\\*clang-output\\*")
            (bk-kill-buffers "\\*clang-error\\*")
            (bk-kill-buffers "\\*cscope.*\\*")))
;;------------------------------------------------------------------------------
;; eshell
(setq eshell-aliases-file "~/Emacs/data/eshell/alias")
(setq eshell-prompt-function 'shk-eshell-prompt) 
(setq eshell-highlight-prompt nil)
;; alias
(defalias 'open 'find-file)
(defalias 'openo 'find-file-other-window)

;;------------------------------------------------------------------------------
(provide 'my-util)

