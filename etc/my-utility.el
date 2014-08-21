;;; Some Utility stuff.

(require 'my-pre)


; yasnippet
(add-to-list 'load-path (expand-utility-path "yasnippet/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (expand-utility-path "yasnippet/yasnippet/snippets"))
;-------------------------------------------------------------------------------
; git
(add-to-list 'load-path (expand-utility-path "git-emacs"))
(require 'git-emacs)
;-------------------------------------------------------------------------------
; tramp
(setq tramp-default-method "ssh")
(setq tramp-auto-save-directory "~/Emacs/data")
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
(add-to-list 'load-path (expand-utility-path "ecb/"))
(load-file (expand-utility-path "ecb/ecb.el"))
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
(add-to-list 'load-path (expand-utility-path "vlfi"))
(require 'vlf-integrate)
;-------------------------------------------------------------------------------
; calendar
(add-to-list 'load-path (expand-utility-path "calfw"))
(require 'calfw)
;-------------------------------------------------------------------------------
;w3m
(add-to-list 'load-path (expand-utility-path "w3m"))
(add-to-list 'load-path (expand-utility-path "APEL"))
(add-to-list 'load-path (expand-utility-path "mit"))
(require 'w3m-load)
;-------------------------------------------------------------------------------
; disbale abbrev mode
(setq-default abbrev-mode nil)
;-------------------------------------------------------------------------------
; feed
;(elfeed-load-opml "~/Emacs/data/rss.opml")
(setq elfeed-feeds
      '(
        ("http://www.ruanyifeng.com/blog/atom.xml" blog)
        ("https://linuxtoy.org/feed" linux)
        ("https://coolshell.cn/feed" blog)
        ("http://talesofcpp.fusionfenix.com/feed/" cpp)
        ("http://blog.think-async.com/feeds/posts/default" cpp)
        ("http://www.importnew.com/feed" java)
        ("http://www.commandlinefu.com/feed/threeup" linux)
        ("http://blog.sina.com.cn/rss/1286528122.xml" product)
        ("http://blog.ecocn.org/feed" eco)
        ("http://feed.feedsky.com/commentshk" read)
        ("http://blog.sina.com.cn/rss/1286402547.xml" read)
        ("http://onehd.herokuapp.com/" read)
		("http://coolshell.cn/feed" blog)
		("http://blog.jobbole.com/feed/" blog)
		("http://feed.feedsky.com/yeeyan-select" read)
		("http://9.douban.com/rss/culture" read)
        ("http://9.douban.com/rss/technology" blog)
        ("http://planet.lisp.org/rss20.xml" lisp)
        ("http://www.ibm.com/developerworks/cn/views/rss/customrssatom.jsp?zone_type=SixZones&zone_by=Java&zone_by=Linux&content_type=select_zones&type_by=%E6%8A%80%E6%9C%AF%E6%96%87%E7%AB%A0&search_by=&day=1&month=01&year=2008&max_entries=10&feed_by=rss&ibm-submit=%E6%8F%90%E4%BA%A4" blog)
                
      ))

;-------------------------------------------------------------------------------
; sound

(defvar writer-keyclick-noise "~/Emacs/data/sound/typewriter-key-1.wav")
(defvar writer-marginbell-noise "~/Emacs/data/sound/typewriter-space-bar-1.wav")
(defvar writer-linefeed-noise "~/Emacs/data/sound/typewriter-paper-1.wav")
(defvar writer-margin-column 80)
(defvar writer-play-command "afplay")

(load-file (expand-utility-path "misc/writer-typewriter.el"))
;(writer-make-noise)



;-------------------------------------------------------------------------------

(provide 'my-utility)

