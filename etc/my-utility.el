;;; Some Utility stuff.

(require 'my-pre)
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
; template  
(require 'template)
(template-initialize)
;-------------------------------------------------------------------------------
; ecb 
(add-to-list 'load-path (expand-utility-path "ecb/"))
;(load-file (expand-utility-path "ecb/ecb.el"))
; `make` first 
(require 'ecb-autoloads)
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
; tpp
(autoload 'tpp-mode "tpp-mode" "TPP mode." t)
(add-to-list 'auto-mode-alist '("\\.tpp$" . tpp-mode))
(setq tpp-command     "xterm -e tpp")
(setq tpp-helpcommand "cat /usr/local/share/doc/tpp/README  | xless")
;-------------------------------------------------------------------------------
; disbale abbrev mode
(setq-default abbrev-mode nil)
;-------------------------------------------------------------------------------
; feed
;(elfeed-load-opml "~/Emacs/data/rss.opml")
(setq elfeed-feeds
      '(
        ("http://www.ruanyifeng.com/blog/atom.xml" blog) ;阮一峰
        ("https://linuxtoy.org/feed" linux) ;linuxtoy
        ("https://coolshell.cn/feed" blog) ;酷克
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
        ("http://9.douban.com/rss/technology" blog)
        ("http://wanimal.lofter.com/rss" lofter)
        ("http://wytoday.lofter.com/rss" lofter)
        ("http://planet.lisp.org/rss20.xml" lisp)
        ("http://wyscienceblog.lofter.com/rss" lofter)
        ("http://songshuhui.net/feed" blog)
        ("http://www.scipark.net/feed/" blog)
        ("http://feed.feedsky.com/clzzxf" read) ;左岸读书
        ("http://feed.feedsky.com/leica" image) ;Leica中文摄影杂志
        ("http://mail.qq.com/cgi-bin/bookcol?colid=314" fun) ;糗事百科
        ("http://cdc.tencent.com/?feed=rss2" design) ;腾讯cdc
        ("http://www.chinawebanalytics.cn/feed/" web) ;网站分析在中国
        ("http://content.businessvalue.com.cn/feed" eco) ;商业价值
        ("http://jy.smzdm.com/feed" life) ;经验盒子
        ("http://kaieconblog.wordpress.com/feed/" eco)
        ("http://beforweb.com/rss.xml" design)
        ("https://pipes.yahoo.com/pipes/pipe.run?_id=c056f83e95a119e8466745db03b0e9e0&_render=rss&weibo=2566038535" weibo)
        ("https://pipes.yahoo.com/pipes/pipe.run?_id=c056f83e95a119e8466745db03b0e9e0&_render=rss&weibo=3261134763" weibo)
        ("http://www.csdn.net/article/rss_lastnews" news)
        ("http://www.ibm.com/developerworks/cn/views/rss/customrssatom.jsp?zone_type=SixZones&zone_by=Java&zone_by=Linux&content_type=select_zones&type_by=%E6%8A%80%E6%9C%AF%E6%96%87%E7%AB%A0&search_by=&day=1&month=01&year=2008&max_entries=10&feed_by=rss&ibm-submit=%E6%8F%90%E4%BA%A4" blog)
                
      ))
;-------------------------------------------------------------------------------
; sound
(defvar writer-keyclick-noise "~/Emacs/data/sound/typewriter-key-1.wav")
(defvar writer-marginbell-noise "~/Emacs/data/sound/typewriter-space-bar-1.wav")
(defvar writer-linefeed-noise "~/Emacs/data/sound/typewriter-paper-1.wav")
(defvar writer-margin-column 80)
(setq play_command "afplay")
(if (eq system-type 'gnu/linux)
    (setq play_command "aplay"))
(defvar writer-play-command play_command)

;(load-file (expand-utility-path "misc/writer-typewriter.el"))
;(writer-make-noise)
;-------------------------------------------------------------------------------
; shell-command
(require 'shell-command)
(shell-command-completion-mode)
; git gutter
(require 'git-gutter)
(global-git-gutter-mode +1)
(git-gutter:linum-setup)
;-------------------------------------------------------------------------------

(provide 'my-utility)

