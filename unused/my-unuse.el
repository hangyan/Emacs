;;; unused package for now

;;-------------------------------------------------------------------------------
;;pig
;; (autoload 'pig-mode "pig-mode.el"
;;   "Major Mode for editing pig files" t)
;; (add-to-list 'auto-mode-alist '("\\.pig\\'" . pig-mode))
;;-------------------------------------------------------------------------------
;;perl
;;(add-to-list 'load-path (expand-lang-path "pde/lisp"))
;;(load "pde-load")
;;-------------------------------------------------------------------------------
;;haskell-mode
;;Note: need `make` first
;;(add-to-list 'load-path (expand-lang-path "haskell"))
;;(add-to-list 'load-path (expand-lang-path "haskell/haskell-mode/"))
;;(require 'haskell-mode-autoloads)
;;(add-to-list 'Info-default-directory-list (expand-lang-path "haskell/haskell-mode/"))
;;(add-to-list 'ac-modes 'haskell-mode)
;;(add-hook 'haskell-mode-hook (lambda () (local-set-key [(return)] 'newline-and-indent)))
;;(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

;;(require 'hi2)
;;(add-hook 'haskell-mode-hook 'turn-on-hi2)

;;(autoload 'ghc-init "ghc" nil t)
;;(autoload 'ghc-debug "ghc" nil t)
;;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;;(require 'company)
;;(add-hook 'haskell-mode-hook 'company-mode)
;;(add-to-list 'company-backends 'company-ghc)
;;(custom-set-variables '(company-ghc-show-info t))
;;-------------------------------------------------------------------------------
;;erlang
;; Note : erlang-base package provide `escript` when compile el files.''
;; (add-to-list 'load-path (expand-lang-path "erlang/eproject"))
;; (add-to-list 'load-path (expand-lang-path "erlang/s"))
;; (add-to-list 'load-path (expand-lang-path "erlang/f"))
;; (add-to-list 'load-path (expand-lang-path "erlang/edts"))
;; (setq edts-inhibit-package-check t)

;; (if (executable-find "elc")
;;  (require 'edts-start))
;;-------------------------------------------------------------------------------
;; lua
;; (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;; (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
;; (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
;;-------------------------------------------------------------------------------
;; R
;;(add-to-list 'load-path (expand-lang-path "ess/lisp"))
;;(load "ess-site")
;;-------------------------------------------------------------------------------

;; gnuplot
;; (autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
;; (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
;; (setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;;-------------------------------------------------------------------------------

;;javacc
;; (autoload 'javacc-mode "javacc-mode.el" "JavaCC mode." t)
;; (setq auto-mode-alist (append '(("/*.\.jj[t]?$" . javacc-mode)) auto-mode-alist))
