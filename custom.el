(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(abbrev-file-name "~/Emacs/data/abbrev_defs")
 '(ac-modes
   (quote
	(go-mode rust-mode jde-mode cmake-mode emacs-lisp-mode lisp-interaction-mode java-mode clojure-mode scala-mode scheme-mode lisp-mode markdown-mode ocaml-mode tuareg-mode shell-script-mode perl-mode cperl-mode ruby-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode)))
 '(auto-save-default t)
 '(auto-save-list-file-prefix "~/.emacs.d/data/auto-save-list/.saves-")
 '(bookmark-default-file "~/Emacs/data/bookmarks")
 '(clean-buffer-list-delay-special 60)
 '(clean-buffer-list-kill-buffer-names
   (quote
	("*Compile-Log*" "*helm-mode-execute-extended-command*")))
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cua-enable-cua-keys nil)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-mode t nil (cua-base))
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(current-language-environment "UTF-8")
 '(cursor-color "#cccccc")
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
	("d9129a8d924c4254607b5ded46350d68cc00b6e38c39fc137c3cfb7506702c12" default)))
 '(delete-selection-mode nil)
 '(display-time-mode t)
 '(ecb-expand-methods-switch-off-auto-expand nil)
 '(ecb-layout-window-sizes
   (quote
	(("left8"
	  (ecb-directories-buffer-name 0.24431818181818182 . 0.29411764705882354)
	  (ecb-sources-buffer-name 0.24431818181818182 . 0.23529411764705882)
	  (ecb-methods-buffer-name 0.24431818181818182 . 0.27450980392156865)
	  (ecb-history-buffer-name 0.24431818181818182 . 0.17647058823529413)))))
 '(ecb-options-version "2.50")
 '(ecb-tip-of-the-day nil)
 '(eshell-directory-name "~/Emacs/data/eshell")
 '(exec-path
   (quote
	("/bin/" "/usr/local/go/bin/" "/bin/" "/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home/bin/" "/usr/local/sbin/" "/usr/local/bin/" "/usr/local/bin/" "/usr/bin/" "/bin/" "/usr/sbin/" "/sbin/" "/usr/local/go/bin/" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9/" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_9/" "/opt/local/bin/" "/opt/local/sbin/" "/usr/local/sbin/" "/usr/local/opt/llvm/bin/" "/Users/yayu/.rvm/bin/" "/Applications/Emacs.app/Contents/MacOS/libexec/" "/Users/yayu/Golang/bin" nil)))
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(global-auto-highlight-symbol-mode t)
 '(global-git-gutter+-mode t)
 '(global-hi-lock-mode t)
 '(global-hl-line-mode nil)
 '(global-srecode-minor-mode nil)
 '(helm-bookmark-show-location t)
 '(hi2-show-indentations nil)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(ispell-personal-dictionary "~/Emacs/data/ispell_english")
 '(package-selected-packages
   (quote
	(auto-complete-c-headers auto-compile auto-complete-auctex ac-slime ac-helm helm-google dockerfile-mode zygospore yaml-mode wsd-mode ws-butler window-layout volatile-highlights toml-mode toml tempbuf sr-speedbar solarized-theme smex smartparens smart-tabs-mode smart-mode-line-powerline-theme smart-compile slime shm shell-toggle scala-mode2 s region-list-edit queue python-pep8 py-autopep8 protobuf-mode pretty-symbols powerline-evil popwin polymode nyan-mode nginx-mode namespaces markdown-mode+ magit log4j-mode kpm-list js3-mode jedi hindent highlight-parentheses highlight hi2 helm-swoop helm-projectile helm-gtags helm-git helm-filesets helm-company hackernews golint go-mode go-autocomplete gnuplot git-gutter-fringe+ ggtags function-args flymake-coffee flycheck-clangcheck find-file-in-project expand-region exec-path-from-shell evil-iedit-state esup emms elm-mode elfeed ediprolog ecb duplicate-thing dtrt-indent dracula-theme dirtree dired+ dash-functional ctags company-ghc company-c-headers column-marker color-theme cmake-mode clojure-mode buffer-move bm auto-indent-mode auto-highlight-symbol apt-utils anzu all aggressive-indent ac-haskell-process)))
 '(py-autopep8-options (quote ("--max-line-length=100")))
 '(py-complete-function (quote py-shell-complete))
 '(py-yapf-options (quote ("--style=pep8")))
 '(python-check-command "flake8")
 '(python-environment-directory "~/.env/")
 '(recentf-save-file "~/Emacs/data/recentf")
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(show-paren-style (quote mixed))
 '(show-smartparens-global-mode t)
 '(template-default-directories (quote ("~/Emacs/data/templates")))
 '(temporary-file-directory "/tmp/emacs")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "nil" :slant normal :weight normal :height 140 :width extra-condensed))))
 '(ac-gtags-candidate-face ((t (:inherit ac-candidate-face :foreground "light green"))))
 '(ac-gtags-selection-face ((t (:inherit ac-selection-face :background "dark magenta")))))
