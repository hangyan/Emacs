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
;; template  
(require 'template)
(template-initialize)
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
;;;-----------------------------------------------------------------------------
;; tpp
;; (autoload 'tpp-mode "tpp-mode" "TPP mode." t)
;; (add-to-list 'auto-mode-alist '("\\.tpp$" . tpp-mode))
;; (setq tpp-command     "xterm -e tpp")
;; (setq tpp-helpcommand "cat /usr/local/share/doc/tpp/README  | xless")
;;;-----------------------------------------------------------------------------
;; disbale abbrev mode
(setq-default abbrev-mode nil)
;;;-----------------------------------------------------------------------------
;; feed
;;(elfeed-load-opml "~/Emacs/data/rss.opml")
(setq elfeed-feeds
      '(
        ("https://linuxtoy.org/feed" linux) ;linuxtoy
        ("https://coolshell.cn/feed" blog) ;酷克
        ("http://talesofcpp.fusionfenix.com/feed/" cpp)
        ("http://blog.think-async.com/feeds/posts/default" cpp)
        ("http://www.commandlinefu.com/feed/threeup" linux)
        ("http://blog.sina.com.cn/rss/1286528122.xml" product)
        ("http://feed.feedsky.com/commentshk" read)
        ("http://blog.sina.com.cn/rss/1286402547.xml" read)
        ("http://feed.feedsky.com/yeeyan-select" read)
        ("http://9.douban.com/rss/technology" blog)
        ("http://wanimal.lofter.com/rss" lofter)
        ("http://planet.lisp.org/rss20.xml" lisp)
        ("http://rss.kuqin.com/")
        ("http://book.zi5.me/feed" news)
        ("http://feed.feedsky.com/leica" image) ;Leica中文摄影杂志
		))
;;;-----------------------------------------------------------------------------
;; sound
(defvar writer-keyclick-noise "~/Emacs/data/sound/typewriter-key-1.wav")
(defvar writer-marginbell-noise "~/Emacs/data/sound/typewriter-space-bar-1.wav")
(defvar writer-linefeed-noise "~/Emacs/data/sound/typewriter-paper-1.wav")
(defvar writer-margin-column 80)
(setq play_command "afplay")
(if (eq system-type 'gnu/linux)
    (setq play_command "aplay"))
(defvar writer-play-command play_command)
;;(load-file (expand-utility-path "misc/writer-typewriter.el"))
;;(writer-make-noise)
;;;-----------------------------------------------------------------------------
;; shell-command
;;(require 'shell-command)
;;(shell-command-completion-mode)
;;;-----------------------------------------------------------------------------
;; git gutter
(require 'git-gutter)
(global-git-gutter-mode +1)
(git-gutter:linum-setup)
;;;-----------------------------------------------------------------------------
;; resetful api client
;;(add-to-list 'load-path (expand-utility-path "restclient"))
;;(require 'restclient)
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
;; expand region
;;(add-to-list 'load-path (expand-utility-path "expand-region"))
;;(require 'expand-region)
;;(global-set-key (kbd "C-=") 'er/expand-region)
;; edit server
;;(add-to-list 'load-path (expand-utility-path "edit-server"))
;;(require 'edit-server)
;;(edit-server-start)
;;;-----------------------------------------------------------------------------
;; dirtree
(require 'dirtree)
;;;-----------------------------------------------------------------------------
;; ack
(require 'ack-and-a-half)
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)
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

