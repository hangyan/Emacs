
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(abbrev-file-name "~/Emacs/data/abbrev_defs")
 '(ansi-color-names-vector [solarized-bg red green yellow blue magenta cyan solarized-fg])
 '(auto-save-list-file-prefix "~/Emacs/data/auto-save-list/.saves-")
 '(bookmark-default-file "~/Emacs/data/bookmarks")
 '(browse-url-new-window-flag t)
 '(browse-url-text-browser "w3m")
 '(cider-lein-command "~/Software/bin/lein")
 '(clean-buffer-list-delay-special 60)
 '(clean-buffer-list-kill-buffer-names (quote ("*Compile-Log*" "*helm-mode-execute-extended-command*")))
 '(column-number-mode t)
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(current-language-environment "Chinese-GBK")
 '(custom-safe-themes (quote ("3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "a81bc918eceaee124247648fc9682caddd713897d7fd1398856a5b61a592cb62" default)))
 '(delete-selection-mode nil)
 '(display-time-mode t)
 '(ecb-expand-methods-switch-off-auto-expand nil)
 '(ecb-layout-window-sizes (quote (("left8" (ecb-directories-buffer-name 0.24431818181818182 . 0.29411764705882354) (ecb-sources-buffer-name 0.24431818181818182 . 0.23529411764705882) (ecb-methods-buffer-name 0.24431818181818182 . 0.27450980392156865) (ecb-history-buffer-name 0.24431818181818182 . 0.17647058823529413)))))
 '(ecb-options-version "2.40")
 '(ecb-tip-of-the-day nil)
 '(ede-project-placeholder-cache-file "~/Emacs/data/ede-projects.el")
 '(emms-cache-file "~/Emacs/data/emms/cache")
 '(emms-directory "~/Emacs/data/emms")
 '(emms-mode-line-format "[ %s ]")
 '(emms-playlist-mode-center-when-go t)
 '(emms-playlist-mode-open-playlists t)
 '(emms-source-file-default-directory "/Users/yayu/Music")
 '(eshell-directory-name "~/Emacs/data/eshell")
 '(fci-rule-color "#eee8d5")
 '(global-srecode-minor-mode nil)
 '(helm-bookmark-show-location t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(javadoc-lookup-cache-dir "~/Emacs/data/java/javadoc-cache")
 '(jde-check-version-flag nil)
 '(jde-jdk-doc-url "http://docs.oracle.com/javase/7/docs/api/")
 '(jde-which-full-class-name t)
 '(mark-even-if-inactive t)
 '(midnight-delay 200)
 '(midnight-mode t nil (midnight))
 '(mu4e-attachment-dir "/Users/yayu/Mail/Files")
 '(mu4e-headers-fields (quote ((:human-date . 12) (:flags . 6) (:size . 7) (:from . 22) (:subject))))
 '(mu4e-html2text-command "/usr/local/bin/html2text")
 '(mu4e-update-interval 600)
 '(mu4e-use-fancy-chars t)
 '(mu4e-view-prefer-html nil)
 '(mu4e-view-show-images t)
 '(py-complete-function (quote py-shell-complete))
 '(quack-programs (quote ("mzscheme" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))
 '(recentf-exclude (quote ("ede-projects.el" ".ido.last" "*javadoc-cache*")))
 '(save-abbrevs nil)
 '(scroll-bar-mode (quote right))
 '(semanticdb-default-save-directory "~/Emacs/data/semanticdb")
 '(show-paren-mode t)
 '(show-paren-style (quote mixed))
 '(show-smartparens-global-mode t)
 '(sp-show-pair-delay 0)
 '(srecode-map-save-file "~/Emacs/data/srecode-map.el")
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(tempbuf-minimum-timeout 10)
 '(template-default-directories (quote ("~/Emacs/data/templates")))
 '(tool-bar-mode nil)
 '(url-configuration-directory "~/Emacs/data/url")
 '(url-cookie-file "~/Emacs/data/url/cookies")
 '(vc-follow-symlinks t)
 '(w3m-confirm-leaving-secure-page nil)
 '(w3m-use-title-buffer-name t)
 '(yas/trigger-key "C-x y"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "nil" :slant normal :weight normal :height 130 :width normal))))
 '(ac-candidate-face ((t (:background "gray10" :foreground "DarkGoldenrod3"))))
 '(ac-selection-face ((t (:background "gray10" :foreground "white"))))
 '(cscope-file-face ((t (:foreground "blue"))))
 '(cscope-line-face ((t (:foreground "dark olive green"))))
 '(minimap-active-region-background ((t (:background "dark slate gray"))) t)
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "black" :box (:line-width 1 :color "white" :style pressed-button)))) t))

;;; Settings need to be load first




;;==============================================================================
;;=========================== GLOBAL SETTINGS ==================================

;; FUNCTION : base paths and functions.
;;------------------------------------------------------------------------------
(setq meta-path "~/Emacs/usr/")
(setq utility-path "~/Emacs/opt/")
(setq lang-path "~/Emacs/dev/")
(setq gui-path "~/Emacs/gui/")

(defun expand-gui-path (sub)
  (concat gui-path sub))

(defun expand-meta-path (sub)
  (concat meta-path sub))

(defun expand-lang-path (sub)
  (concat lang-path sub))

(defun expand-utility-path (sub)
  (concat utility-path sub))

(add-to-list 'load-path (expand-lang-path "misc"))
(add-to-list 'load-path (expand-utility-path "misc"))

;;------------------------------------------------------------------------------
;; ENV : windows bash
(if (eq system-type 'windows-nt)
    (progn
      (setq explicit-shell-file-name "bash.exe") 
      ;; For subprocesses invoked via the shell 
      ;; (e.g., "shell -c command") 
      (setq shell-file-name explicit-shell-file-name) 
      ))

;;------------------------------------------------------------------------------
;; VAR : disable large file promt
(setq large-file-warning-threshold nil)
;;------------------------------------------------------------------------------
;; FUNCTION : terminal or gui
(defun is-in-terminal()
  (not (display-graphic-p)))
;;------------------------------------------------------------------------------
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive
   (progn
     (if (not (buffer-file-name))
         (error "Buffer '%s' is not visiting a file!" (buffer-name)))
     (list (read-file-name (format "Rename %s to: " (file-name-nondirectory
                                                     (buffer-file-name)))))))
  (if (equal new-name "")
      (error "Aborted rename"))
  (setq new-name (if (file-directory-p new-name)
                     (expand-file-name (file-name-nondirectory
                                        (buffer-file-name))
                                       new-name)
                   (expand-file-name new-name)))
  ;; If the file isn't saved yet, skip the file rename, but still update the
  ;; buffer name and visited file.
  (if (file-exists-p (buffer-file-name))
      (rename-file (buffer-file-name) new-name 1))
  (let ((was-modified (buffer-modified-p)))
    ;; This also renames the buffer, and works with uniquify
    (set-visited-file-name new-name)
    (if was-modified
        (save-buffer)
      ;; Clear buffer-modified flag caused by set-visited-file-name
      (set-buffer-modified-p nil))
    (message "Renamed to %s." new-name)))
;;------------------------------------------------------------------------------
;; LIB : dash
(eval-after-load "dash" '(dash-enable-font-lock))
;;------------------------------------------------------------------------------
;; LIB : package 
(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize) ; 0.1 sec
;;------------------------------------------------------------------------------
(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)))

(add-hook 'find-file-hooks 'my-find-file-check-make-large-file-read-only-hook)
;;------------------------------------------------------------------------------

;; UI : Imenu
(setq imenu-auto-rescan t)
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "Imenu") (error nil)))
(add-hook 'font-lock-mode-hook 'try-to-add-imenu)
;;------------------------------------------------------------------------------
;; LIB : yasnippet
(add-to-list 'load-path (expand-meta-path "yasnippet"))
(require 'yasnippet)
(setq yas-snippet-dirs '("~/Emacs/usr/yasnippet/snippets"))
(defalias 'yas/get-snippet-tables 'yas--get-snippet-tables)
(defalias 'yas/table-hash 'yas--table-hash)
(yas-global-mode 1)
;;------------------------------------------------------------------------------
;; LIB : cscope
(require 'xcscope)
(setq exec-path (append '("~/Emacs/bin")
                        exec-path))
(add-to-list 'exec-path "~/Software/bin")

;;==============================================================================







;;==============================================================================
;;========================= AUTO COMPLETE ======================================
(add-to-list 'load-path (expand-meta-path "auto-complete"))
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories (expand-meta-path "auto-complete/ac-dict"))
(add-to-list 'ac-modes 'cmake-mode)
(add-to-list 'ac-modes 'jde-mode)
(setq ac-source-yasnippet nil)


(add-to-list 'load-path (expand-lang-path "cpp/ac-c-headers"))
(defun my-ac-cc-mode-setup ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
(add-hook 'c++-mode-hook 'my-ac-cc-mode-setup)


(add-to-list 'ac-sources 'ac-source-files-in-current-dir)
(add-to-list 'ac-sources 'ac-source-words-in-same-mode-buffers)

;;==============================================================================



;;==============================================================================
;;======================= GUI SETTINGS =========================================

;; VAR : gui paths
(add-to-list 'load-path (expand-gui-path "misc"))
(add-to-list 'load-path (expand-gui-path "smartparens"))

(transient-mark-mode t)

;; UI : remove startup info
(setq initial-scratch-message nil)
(setq inhibit-splash-message t)
(setq inhibit-startup-message t)

;; UI : toobar menubar
(if window-system
    (tool-bar-mode 0))


;; UI : replace yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)

;; UI : scroll bar 
(if window-system
    (scroll-bar-mode 0))
(customize-set-variable 'scroll-bar-mode 'right)

;; UI : Cursor
(setq-default cursor-type 'bar)

;; UI : Indent tab
(setq-default tab-width 4)
(setq indent-line-funtion 'insert-tab)

(setq require-final-newline t)

(setq-default indent-tabs-mode t)
;; BASE : Backup
(setq auto-save-default nil)
(setq-default make-backup-files nil)

;; LIB : smart-mode-line
(add-to-list 'load-path (expand-gui-path "smart-mode-line"))
(require 'smart-mode-line)
(sml/setup)
(sml/apply-theme 'dark)

;; LIB : Parentheses 
(require 'paren)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; LIB : hightlight-parenteses
(require 'highlight-parentheses)
;;------------------------------------------------------------------------------
;; UI : global-hightlight-mode
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
;;------------------------------------------------------------------------------
;; LIB : smartparens
(require 'smartparens-config)
(show-smartparens-global-mode t)
(smartparens-global-mode 1)

;;------------------------------------------------------------------------------
;; UI : Line/column number
(when (display-graphic-p)
  (require 'linum)
  (global-linum-mode t))

(setq column-number-mode t)
;;------------------------------------------------------------------------------
;; UI : THEME
(when (display-graphic-p)
  (add-to-list 'custom-theme-load-path (expand-gui-path "themes/")))
(add-to-list 'custom-theme-load-path (expand-gui-path "themes/solarized"))
(if (eq system-type 'darwin)
    (load-theme 'noctilux t)
  (load-theme 'ujelly t))
;;(load-theme 'solarized-dark t))
;;------------------------------------------------------------------------------
;; UI :  Terminal settings
(when (is-in-terminal)
  (require 'lacarte)
  (global-set-key [?\e ?\M-x] 'lacarte-execute-command)
  (global-set-key [?\M-`] 'lacarte-execute-command))
;;------------------------------------------------------------------------------
;; UI : Right margin
(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(setq fci-rule-color "blue")
(setq fci-rule-use-dashes t)
(setq fci-rule-width 1)
(setq fci-rule-color "red")
(add-hook 'after-change-major-mode-hook 'fci-mode)
;;------------------------------------------------------------------------------
;; UI :  Indent guide
(require 'indent-guide)
(indent-guide-global-mode)
;;(set-face-background 'indent-guide-face "dimgray")
(setq indent-guide-char "|")
;;------------------------------------------------------------------------------
;; BASE : Buffers

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq inhibit-default-init t)
(setq-default frame-title-format "%b (%f)")
;;------------------------------------------------------------------------------
;; LIB : Recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;;------------------------------------------------------------------------------
;; LIB :  Neotree
(require 'neotree)

;;------------------------------------------------------------------------------
;; LIB : Nav
(add-to-list 'load-path (expand-gui-path "nav"))
(require 'nav)
(nav-disable-overeager-window-splitting)
;;------------------------------------------------------------------------------
;; BASE : modes
(setq enable-recursive-minibuffers t) ;; allow recursive editing in minibuffer
(follow-mode t)                       ;; follow-mode allows easier editing of long files

(setq major-mode 'text-mode)
(add-hook 'text-mode-hook
          '(lambda()
             (turn-on-auto-fill)
             (set-fill-column 80)))
;;------------------------------------------------------------------------------


;;==============================================================================




;;==============================================================================
;;===========================HELM ==============================================
(add-to-list 'load-path (expand-meta-path "helm"))
(require 'helm)
;; must set before helm-config,  otherwise helm use default
;; prefix "C-x c", which is inconvenient because you can
;; accidentially pressed "C-x C-c"
(setq helm-command-prefix-key "C-c h")

(require 'helm-config)
(require 'helm-eshell)
(require 'helm-files)
(require 'helm-grep)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

(setq
 helm-google-suggest-use-curl-p t
 helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
 helm-quick-update t ; do not display invisible candidates
 helm-idle-delay 0.01 ; be idle for this many seconds, before updating in delayed sources.
 helm-input-idle-delay 0.01 ; be idle for this many seconds, before updating candidate buffer
 helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
 
 ;; you can customize helm-do-grep to execute ack-grep
 ;; helm-grep-default-command "ack-grep -Hn --smart-case --no-group --no-color %e %p %f"
 ;; helm-grep-default-recurse-command "ack-grep -H --smart-case --no-group --no-color %e %p %f"
 helm-split-window-default-side 'other ;; open helm buffer in another window
 helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
 helm-buffers-favorite-modes (append helm-buffers-favorite-modes
                                     '(picture-mode artist-mode))
 helm-candidate-number-limit 500 ; limit the number of displayed canidates
 helm-M-x-requires-pattern 0     ; show all candidates when set to 0
 helm-boring-file-regexp-list
 '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$") ; do not show these files in helm buffer
 helm-ff-file-name-history-use-recentf t
 helm-move-to-line-cycle-in-source t ; move to end or beginning of source
                                        ; when reaching top or bottom of source.
 ido-use-virtual-buffers t      ; Needed in helm-buffers-list
 helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non-nil
                                        ; useful in helm-mini that lists buffers
 )

;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

(helm-mode)

(provide 'my-helm)
;;==============================================================================




;;==============================================================================
;; ================   LANGUAGE : CPP ===========================================

(add-to-list 'load-path (expand-lang-path "cpp"))


(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq gdb-many-windows t)

(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))


(setq c-macro-shrink-window-flag t)
(setq c-macro-preprocessor "cpp")
(setq c-macro-cppflags " ")
(setq c-macro-prompt-flag t)
(setq hs-minor-mode t)
;;------------------------------------------------------------------------------
(defun astyle-this-buffer (pmin pmax)
  (interactive "r")
  (shell-command-on-region pmin pmax
                           "astyle --style=kr -xk -xl" ;; add options here...
                           (current-buffer) t 
                           (get-buffer-create "*Astyle Errors*") t))
;;------------------------------------------------------------------------------
(require 'member-functions)
(autoload 'expand-member-functions "member-functions"
  "Expand C++ member function declarations" t)
(add-hook 'c++-mode-hook (lambda ()
						   (local-set-key "\C-cm" #'expand-member-functions)))
;;(setq mf--source-file-extension "cpp")
;;------------------------------------------------------------------------------

;;==============================================================================



;;==============================================================================
;;========================= UTILITY ============================================

;global vars
(setq stack-trace-on-error t)
;(set-default buffer-file-coding-system 'utf-8-unix)
;(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
;(set-default default-buffer-file-coding-system 'utf-8-unix)
;;;-----------------------------------------------------------------------------
;; tramp
(setq tramp-default-method "ssh")
(setq tramp-auto-save-directory "~/Emacs/data")
;;;-----------------------------------------------------------------------------
;; smart compile
(require 'smart-compile)

(add-to-list 'smart-compile-alist 
             '("\\.scala\\'" . "scala -feature -deprecation %f"))
(add-to-list 'smart-compile-alist
			 '("\\.rs\\'" . "rustc %f"))
(add-to-list 'smart-compile-alist
			 '("Cargo\\.toml\\'" . "cargo build"))
;;;-----------------------------------------------------------------------------
;; shell toggle
(require 'shell-toggle-patched)
(autoload 'shell-toggle "shell-toggle" t)
(autoload 'shell-toggle-cd "shell-toggle" t)

(global-set-key [C-f1] 'shell-toggle-cd)
;;;-----------------------------------------------------------------------------
;;;-----------------------------------------------------------------------------
;; ecb 
(add-to-list 'load-path (expand-utility-path "ecb/"))
;;(load-file (expand-utility-path "ecb/ecb.el"))
;; `make` first 
;;(require 'ecb)
(require 'ecb-autoloads)
;;;-----------------------------------------------------------------------------
;; cmake  
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
            auto-mode-alist))
;; disbale abbrev mode
(setq-default abbrev-mode nil)
;;------------------------------------------------------------------------------
;; toml
(require 'toml-mode)
;;;-----------------------------------------------------------------------------
;;multi cursor
(add-to-list 'load-path (expand-utility-path "multiple-cursors"))
(require 'multiple-cursors)
;;;-----------------------------------------------------------------------------
;; RSS
(setq elfeed-feeds
      '(
        "http://blog.docker.com/feed/"
		"http://blog.codingnow.com/atom.xml"
		"http://blog.jobbole.com/feed/"
		"http://jandan.net/feed"
		"http://zhihurss.jd-app.com/dailyrss"
		"http://www.tedunangst.com/flak/rss"
		"http://www.huxiu.com/rss/0.xml"
		"http://www.ifanr.com/feed"
		"http://rss.aqee.net/"
		"http://blog.sina.com.cn/rss/1286528122.xml"
		"http://coolshell.cn/feed"))
;;------------------------------------------------------------------------------
;; hacknews
(require 'hackernews)
;;------------------------------------------------------------------------------
;; popwin
(require 'popwin)
(popwin-mode 1)
;; (setq display-buffer-function 'popwin:display-buffer)
(push '("^\*compilation.+\*$" :regexp t) popwin:special-display-config)
(push '("^\*[Hh]elm.+\*$" :regexp t) popwin:special-display-config)

;; midnight
(require 'midnight)
;;------------------------------------------------------------------------------
;; temp buffer
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'compilation-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'custom-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'help-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'recentf-dialog-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'special-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'buffer-menu-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'Info-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'debugger-mode-hook 'turn-on-tempbuf-mode)



;; kill buffers function
(require 'cl)
(defun bk-kill-buffers (regexp)
  "Kill buffers matching REGEXP without asking for confirmation."
  (interactive "sKill buffers matching this regular expression: ")
  (flet ((kill-buffer-ask (buffer) (kill-buffer buffer)))
    (kill-matching-buffers regexp)))

(add-hook 'tempbuf-mode-hook
		  (lambda ()
			(bk-kill-buffers "\\*[Hh]elm.*\\*")
			(bk-kill-buffers "\\*markdown-output\\*")
			(bk-kill-buffers "\\*cscope.*\\*")))
;;------------------------------------------------------------------------------
;; eshell
(setq eshell-aliases-file "~/Emacs/data/eshell/alias")
;; promt
(defmacro with-face (str &rest properties)
  `(propertize ,str 'face (list ,@properties)))

(defun shk-eshell-prompt ()
  (let ((header-bg "#fff"))
    (concat
     (with-face (concat (eshell/pwd) " ") :background header-bg :foreground "golden")
     (with-face (format-time-string "(%Y-%m-%d %H:%M) " (current-time)) :background header-bg :foreground "#888")
     (with-face
      (or (ignore-errors (format "(%s)" (vc-responsible-backend default-directory))) "")
      :background header-bg
	  :foreground "green")
     (with-face "\n" :background header-bg)
     (with-face user-login-name :foreground "blue")
     "@"
     (with-face "localhost" :foreground "green")
     (if (= (user-uid) 0)
         (with-face " #" :foreground "red")
       " $")
     " ")))
(setq eshell-prompt-function 'shk-eshell-prompt)
(setq eshell-highlight-prompt nil)
;; alias
(defalias 'open 'find-file)
(defalias 'openo 'find-file-other-window)
;;------------------------------------------------------------------------------
;; emacs w3m
(add-to-list 'load-path (expand-utility-path "emacs-w3m"))
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
;; (global-set-key "\C-xm" 'browse-url-at-point)
;; cookies
(setq w3m-use-cookies t)
;; webpage 
(if (string= system-type "darwin")
    (setq process-connection-type nil))
;; user agent
(setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")
;; hackewnews
(defun hn ()
  (interactive)
  (browse-url "http://news.ycombinator.com"))

;; wiki
(defun wikipedia-search (search-term)
  "Search for SEARCH-TERM on wikipedia"
   (interactive
    (let ((term (if mark-active
                    (buffer-substring (region-beginning) (region-end))
                  (word-at-point))))
      (list
       (read-string
        (format "Wikipedia (%s):" term) nil nil term)))
    )
   (browse-url
    (concat
     "http://en.m.wikipedia.org/w/index.php?search="
      search-term
      ))
   )
;; add http://
(defun w3m-open-site (site)
  "Opens site in new w3m session with ‘http://’ appended"
   (interactive
    (list (read-string "Enter website address(default: w3m-home):" nil nil w3m-home-page nil )))
   (w3m-goto-url-new-session
    (concat "http://" site)))
;; mac
(defun browse-url-default-macosx-browser (url &optional new-window)
  (interactive (browse-url-interactive-arg "URL: "))
  (if (and new-window (>= emacs-major-version 23))
      (do-applescript
       (format (concat "tell application \"Safari\" to make document with properties {URL:\"%s\"}\n"
                       "tell application \"Safari\" to activate") url))
    (start-process (concat "open " url) nil "open" url)))
;;------------------------------------------------------------------------------
;; indent
;; (global-aggressive-indent-mode 1)
(auto-indent-global-mode)
;;;-----------------------------------------------------------------------------
;;==============================================================================



;;==============================================================================
;;============================ OTHER LANGUAGES =================================

(add-to-list 'load-path (expand-lang-path "misc"))
;;-------------------------------------------------------------------------------
;;javacc
;; (autoload 'javacc-mode "javacc-mode.el" "JavaCC mode." t)
;; (setq auto-mode-alist (append '(("/*.\.jj[t]?$" . javacc-mode)) auto-mode-alist))
;;-------------------------------------------------------------------------------
;;asm
(require 'gas-mode)
(load-file (expand-lang-path "misc/asm86-mode.el"))
;;-------------------------------------------------------------------------------
										;ant
(add-to-list 'auto-mode-alist '("\\.ant$" . ant-mode))
;;-------------------------------------------------------------------------------
;; gnuplot
;; (autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
;; (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
;; (setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))
;;-------------------------------------------------------------------------------
;;markdown
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(setq markdown-css-dir "~/Emacs/data/markdown-css/")
(setq markdown-css-theme "clearness")

;;-------------------------------------------------------------------------------
;;json avsc
(autoload 'json-mode "json-mode.el"
  "Major mode for editing json/avsc files" t)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.avsc\\'" . json-mode))
;;-------------------------------------------------------------------------------
;;pig
;; (autoload 'pig-mode "pig-mode.el"
;;   "Major Mode for editing pig files" t)
;; (add-to-list 'auto-mode-alist '("\\.pig\\'" . pig-mode))
;;-------------------------------------------------------------------------------
;;perl
(add-to-list 'load-path (expand-lang-path "pde/lisp"))
;;(load "pde-load")
;;-------------------------------------------------------------------------------
;;haskell-mode
;;Note: need `make` first
(if (not (eq system-type 'windows-nt))
    (progn
	  (add-to-list 'load-path (expand-lang-path "haskell-mode/"))
	  (require 'haskell-mode-autoloads)
	  (add-to-list 'Info-default-directory-list (expand-lang-path "haskell-mode/"))
	  (add-to-list 'ac-modes 'haskell-mode)
	  (add-hook 'haskell-mode-hook (lambda () (local-set-key [(return)] 'newline-and-indent)))))
	  

;;-------------------------------------------------------------------------------

;;-------------------------------------------------------------------------------
;;erlang
;; Note : erlang-base package provide `escript` when compile el files.''
(add-to-list 'load-path (expand-lang-path "erlang/eproject"))
(add-to-list 'load-path (expand-lang-path "erlang/s"))
(add-to-list 'load-path (expand-lang-path "erlang/f"))
(add-to-list 'load-path (expand-lang-path "erlang/edts"))
(setq edts-inhibit-package-check t)

(if (executable-find "elc")
	(require 'edts-start))
;;-------------------------------------------------------------------------------
;; sql upcase.
(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)
;;-------------------------------------------------------------------------------
;; yaml
(autoload 'yaml-mode "yaml-mode.el"
  "Major mode for editing yml files" t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;;-------------------------------------------------------------------------------
;; lua
;; (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;; (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
;; (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
;;-------------------------------------------------------------------------------
;; log files
(autoload 'log4j-mode "log4j-mode" "Major mode for viewing log files." t)
(add-to-list 'auto-mode-alist '("\\.log\\'" . log4j-mode))
;;-------------------------------------------------------------------------------
;; bash
(require 'bash-completion)
(bash-completion-setup)
(add-to-list 'auto-mode-alist '("zshrc" . shell-script-mode))
;;-------------------------------------------------------------------------------
;; dockfile
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
;;-------------------------------------------------------------------------------
;; rust
(add-to-list 'load-path (expand-lang-path "rust-mode"))
(require 'rust-mode-autoloads)
(add-to-list 'ac-modes 'rust-mode)
;;-------------------------------------------------------------------------------
;; R
(add-to-list 'load-path (expand-lang-path "ess/lisp"))
;;(load "ess-site")
;;------------------------------------------------------------------------------
;;==============================================================================





;;==============================================================================
;;====================== LANGUAGE : golang =====================================

(add-to-list 'load-path (expand-utility-path "deferred"))

(cond ((eq system-type 'darwin)
	   (progn
		 (setenv "GOPATH" "/Users/yayu/Golang")
		 (setq exec-path (append '("/Users/yayu/Golang/bin") exec-path))))
	  ((eq system-type 'windows-nt)
	   (setenv "GOPATH" "/Golang"))   ;same with the setting of .bashrc
	  (t (setenv "GOPATH" "/home/yuyan/Golang"))
	  )
 										;
(add-to-list 'load-path (expand-lang-path "go-mode"))


; godef repo: github.com/chenjianlong/rog-go/exp/cmd/godef
(require 'go-mode)

(require 'go-autocomplete)
(require 'auto-complete-config)


;;(require 'go-eldoc)
;;(go-eldoc-setup)

(require 'golint)

  ; go flymake
(setq goflymake-path "~/Golang/src/github.com/dougm/goflymake")
(if (file-exists-p goflymake-path)
	(progn 
	  (add-to-list 'load-path goflymake-path)
	  (require 'go-flymake)))


(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-s") 'godoc-at-point)
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))

;;==============================================================================





;;==============================================================================
;;======================== lANGUAGE : web ======================================


(add-to-list 'load-path (expand-lang-path "web-mode"))
(add-to-list 'load-path (expand-lang-path "rainbow-mode"))

;xml
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)

;php
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))

; http server
(add-to-list 'load-path (expand-lang-path "web-server"))
(require 'simple-httpd)
(setq httpd-root "~/Emacs/data/www")
;(httpd-start)

;js
(add-to-list 'load-path (expand-lang-path "js2-mode"))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-to-list 'load-path (expand-lang-path "ac-js2"))
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)

; skewer
;; (add-to-list 'load-path (expand-lang-path "skewer-mode"))
;; (require 'skewer-mode)
;; (add-hook 'js2-mode-hook 'skewer-mode)
;; (add-hook 'css-mode-hook 'skewer-css-mode)
;; (add-hook 'html-mode-hook 'skewer-html-mode)

;html5
(add-to-list 'load-path (expand-lang-path "html5"))
(eval-after-load "rng-loc"
  '(add-to-list 'rng-schema-locating-files (expand-lang-path "html5/schemas.xml")))

;(require 'whattf-dt)


										; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-element-highlight t)

; rainbow
(dolist (hook '(css-mode-hook
             html-mode-hook
			 web-mode-hook))
  (add-hook hook (lambda ()
				   (require 'rainbow-mode)
				   (rainbow-mode t))))

;;==============================================================================





;;==============================================================================
;;======================= LANGUAGE : scala =====================================
; scala mode
(add-to-list 'load-path (expand-lang-path "scala/scala-mode2"))
(require 'scala-mode2)


; ensime
(add-to-list 'load-path (expand-lang-path "scala/ensime"))
;(require 'ensime)
;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;sbt
(add-to-list 'load-path (expand-lang-path "scala/sbt-mode"))
(require 'sbt-mode)

(defun my-scala-mode-hook ()
  (add-to-list 'ac-sources 'ac-source-words-in-same-mode-buffers)
  (add-to-list 'ac-sources 'ac-source-dictionary)
  (setq ac-ignore-case nil))
(add-hook 'scala-mode-hook 'my-scala-mode-hook)

;;==============================================================================






;;==============================================================================
;;========================== LANGUAGE : python =================================

(add-to-list 'load-path (expand-lang-path "emacs-for-python"))
; pylookup -doc
(setq pylookup-dir (expand-lang-path "pylookup"))
(add-to-list 'load-path pylookup-dir)



(load-file (expand-lang-path "emacs-for-python/epy-init.el"))
 ;install 'pyflakes' via 'pip install --upgrade pyflakes'
(epy-setup-checker "pyflakes %f")
(global-hl-line-mode t)
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)
;; load pylookup when compile time
(eval-when-compile (require 'pylookup))
;; set executable file and db file
(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))
	

(add-hook 'python-mode-hook
          (lambda () (local-set-key  (kbd "C-c C-l")  #'pylookup-lookup-at-point)))




;; set search option if you want
;; (setq pylookup-search-options '("--insensitive" "0" "--desc" "0"))

;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)

;; eg ./pylookup.py -u http://docs.python.org

(autoload 'pylookup-update "pylookup" 
  "Run pylookup-update and create the database at `pylookup-db-file'." t)

;;==============================================================================






;;==============================================================================
;;======================== LANGUAGE : java =====================================


;;(add-to-list 'load-path (expand-lang-path "java/misc"))
;;(add-to-list 'load-path (expand-lang-path "java/fringe-helper"))
;;(add-to-list 'load-path (expand-lang-path "java/malabar-mode"))
;(add-to-list 'load-path (expand-lang-path "java/javadoc-lookup"))

; malabar mode
; Note : 1. need javat-wy.el ,but my cedet not provide.download from others.
;        2. need groovy.
;;  (autoload 'malabar-mode "malabar-mode.el" "Java Dev." t)
;; ;; ;(require 'malabar-mode)
;;  (setq malabar-groovy-lib-dir "~/Emacs/data/java/jar/")
;;  (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

; auto complete
;; (add-to-list 'load-path (expand-lang-path "java/auto-java-complete"))
;; (require 'ajc-java-complete-config)
;; (add-hook 'java-mode-hook 'ajc-java-complete-mode)
;; (add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)
;; (add-hook 'jde-mode-hook 'ajc-java-complete-mode)
;; (add-hook 'malabar-mode 'ajc-java-complete-mode)
;; (add-to-list 'ac-modes 'malabar-mode)

; javadoc
;; (add-hook 'java-mode-hook
;; 		  (lambda ()
;; 			(require 'javadoc-lookup)
;; 			(global-set-key (kbd "C-h j") 'javadoc-lookup)))

; javadoc help
;; (require 'javadoc-help)
;; (add-hook 'java-mode-hook
;; 		  (lambda ()
;; 			(local-set-key (kbd "C-c C-j") 'javadoc-look)))

; jdee -> disable malabar
 ;; (add-to-list 'load-path (expand-lang-path "java/jdee-2.4.1/lisp"))
 ;; (load "jde")
 ;; (add-hook 'java-mode-hook
 ;; 		  (lambda ()
;; 			(local-set-key [(control tab)] 'jde-complete)))


;; (add-to-list 'load-path (expand-lang-path "java/emacs-eclim"))
;; (require 'eclim)
;; (global-eclim-mode)
;; (require 'eclimd)

;; (setq help-at-pt-display-when-idle t)
;; (setq help-at-pt-timer-delay 0.1)
;; (help-at-pt-set-timer)

;; (require 'ac-emacs-eclim-source)
;; (ac-emacs-eclim-config)
;;==============================================================================




;;==============================================================================
;;========================= LANGUAGE : lisp ====================================

(add-to-list 'load-path (expand-lang-path "slime/"))  ; your SLIME directory
(setq inferior-lisp-program "/usr/local/bin/clisp") ; your Lisp system
(require 'slime-autoloads)

(add-to-list 'auto-mode-alist '("emacs" . emacs-lisp-mode))

(setq slime-lisp-implementations
	  '(
		(sbcl ("/usr/local/bin/sbcl") :coding-system utf-8-unix)
		(cmucl ("/usr/bin/cmucl") "-quite")
		(clisp ("/usr/local/bin/clisp") :coding-system utf-8-unix)
		(racket ("/usr/bin/racket") :coding-system utf-8-unix)
		(guile ("/usr/bin/guile") :coding-system utf-8-unix)
		(bigloo ("/usr/bin/bigloo") :coding-system utf-8-unix)
		))



(defun my-emacs-lisp-mode-hook ()
  (local-set-key  (kbd "C-c C-v")  #'eval-buffer)
  )
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)


(add-to-list 'load-path (expand-lang-path "lisp"))
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)

										; copy from yinwang.
(require 'cmuscheme)
(setq scheme-program-name "petite")         ;; 如果用 Petite 就改成 "petite"


;; bypass the interactive question and start the default interpreter
(defun scheme-proc ()
  "Return the current Scheme process, starting one if necessary."
  (unless (and scheme-buffer
               (get-buffer scheme-buffer)
               (comint-check-proc scheme-buffer))
    (save-window-excursion
      (run-scheme scheme-program-name)))
  (or (scheme-get-process)
      (error "No current process. See variable `scheme-buffer'")))


(defun scheme-split-window ()
  (cond
   ((= 1 (count-windows))
    (delete-other-windows)
    (split-window-vertically (floor (* 0.68 (window-height))))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window 1))
   ((not (find "*scheme*"
               (mapcar (lambda (w) (buffer-name (window-buffer w)))
                       (window-list))
               :test 'equal))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window -1))))


(defun scheme-send-last-sexp-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-last-sexp))


(defun scheme-send-definition-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-definition))

(add-hook 'scheme-mode-hook
		  (lambda ()
			(paredit-mode 1)
			(define-key scheme-mode-map (kbd "<f5>")
			  'scheme-send-last-sexp-split-window)
			(define-key scheme-mode-map (kbd "<f6>")
			  'scheme-send-definition-split-window)))

;;==============================================================================






;; tuareg : ocaml env
(add-to-list 'load-path (expand-lang-path "tuareg"))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(autoload 'tuareg-imenu-set-imenu "tuareg-imenu" 
  "Configuration of imenu for tuareg" t)

(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist 
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))




;; cider : clojure env
;; (add-to-list 'load-path (expand-lang-path "cider"))
;; (require 'cider)

;; (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; (setq nrepl-log-messages t)
;; (setq nrepl-hide-special-buffers t)



;; kpm-list : switch buffers
(require 'kpm-list)


;; uniquify : buffer names uniq
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


;; trunted lines
(setq-default truncate-lines t)

;;dired+
(require 'dired+)

;; bookmark
;; Put Last-Selected Bookmark on Top
(defadvice bookmark-jump (after bookmark-jump activate)
  (let ((latest (bookmark-get-bookmark bookmark)))
    (setq bookmark-alist (delq latest bookmark-alist))
    (add-to-list 'bookmark-alist latest)))

;; emms
(require 'emms-setup)
(require 'emms-mode-line)
(require 'emms-source-file)
(require 'emms-source-playlist)
(require 'emms-player-simple)
(require 'emms-player-mplayer)
(require 'emms-playlist-mode)
(require 'emms-info)
(require 'emms-cache)
(require 'emms-playing-time)
(require 'emms-score)
(require 'emms-volume)

(emms-standard)
(emms-default-players)
(setq emms-playlist-buffer-name "*Music*")
;;(setq emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
(setq emms-source-file-default-directory "/Users/yayu/Music")
(add-hook 'emms-player-started-hook 'emms-show)

;; revert
(global-auto-revert-mode t)


;;; all keys

;; moving be functions keys
(global-set-key (kbd "C-c j a") 'beginning-of-defun)
(global-set-key (kbd "C-c j e") 'end-of-defun)
(global-set-key (kbd "C-c j h") 'mark-defun)

;; urls
(global-set-key "\C-c\C-z." 'browse-url-at-point)
(global-set-key "\C-c\C-zb" 'browse-url-of-buffer)
(global-set-key "\C-c\C-zr" 'browse-url-of-region)
(global-set-key "\C-c\C-zu" 'browse-url)
(global-set-key "\C-c\C-zv" 'browse-url-of-file)
(global-set-key "\C-c\C-zs" 'browse-url-default-macosx-browser)
(add-hook 'dired-mode-hook
          (lambda ()
            (local-set-key "\C-c\C-zf" 'browse-url-of-dired-file)))

;;  cscope
 (if (eq system-type 'darwin)
     (progn
       (define-key global-map [(meta f2)]  'cscope-set-initial-directory)
       (define-key global-map [(meta f3)]  'cscope-index-files)
       (define-key global-map [(meta f4)]  'cscope-find-this-symbol)
       (define-key global-map [(meta f5)]  'cscope-find-functions-calling-this-function)
       (define-key global-map [(meta f7)]  'cscope-find-this-file)
       (define-key global-map [(meta f8)] 'cscope-display-buffer-toggle)
       )
   (progn
     (define-key global-map [(control f2)]  'cscope-set-initial-directory)
     (define-key global-map [(control f3)]  'cscope-index-files)
     (define-key global-map [(control f4)]  'cscope-find-this-symbol)
     (define-key global-map [(control f5)]  'cscope-find-functions-calling-this-function)
     (define-key global-map [(control f7)]  'cscope-display-buffer)
     (define-key global-map [(control f8)] 'cscope-display-buffer-toggle)))


;; C-x freq use comands
(define-key global-map "\C-xm" 'pop-to-mark-command)
(define-key global-map "\C-xg" 'customize-group)
(define-key global-map "\C-xp" 'package-install)
;; smart-compile
(global-set-key (kbd "C-x j") 'smart-compile)
(define-key yas-minor-mode-map (kbd "C-x y") 'yas-expand)

;; ac and yas
(define-key ac-mode-map  (kbd "M-/") 'auto-complete)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)


(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;; url
(global-set-key [S-mouse-2] 'browse-url-at-mouse)

;; menu bar open
(global-set-key [f3] 'menu-bar-open)
;; neo tree
(global-set-key [f4] 'neotree-toggle)
;; shell 
(global-set-key [f6] 'shell-toggle)
;; gdb
(global-set-key [f10] 'gdb)
;; ecb
(global-set-key (kbd "C-c b a") 'ecb-activate)
(global-set-key (kbd "C-c b d") 'ecb-deactivate)

;; RET
(add-hook 'lisp-mode-hook '(lambda ()
                             (local-set-key (kbd "RET") 'newline-and-indent)))
(define-key global-map (kbd "RET") 'newline-and-indent)
;; recent files
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; buffer menu
(global-set-key (kbd "\C-x\C-b") 'buffer-menu-other-window)

;; helm
(global-set-key (kbd "M-x") 'execute-extended-command)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-c h g") 'helm-do-grep)
(global-set-key (kbd "C-c h C-c w") 'helm-wikipedia-suggest)
(global-set-key (kbd "C-c h x") 'helm-register)

(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)
(define-key 'help-command (kbd "C-l") 'helm-locate-library)

;; windows
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; multi cursor
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


;; emms
(global-set-key (kbd "C-c e t") 'emms-play-directory-tree)
(global-set-key (kbd "C-c e x") 'emms-start)
(global-set-key (kbd "C-c e v") 'emms-stop)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd "C-c e p") 'emms-previous)
(global-set-key (kbd "C-c e o") 'emms-show)
(global-set-key (kbd "C-c e h") 'emms-shuffle)
(global-set-key (kbd "C-c e e") 'emms-play-file)
(global-set-key (kbd "C-c e f") 'emms-play-playlist)
(global-set-key (kbd "C-c e SPC") 'emms-pause)
(global-set-key (kbd "C-c e a") 'emms-add-directory-tree)

;; popwin
(global-set-key (kbd "C-z") popwin:keymap)
