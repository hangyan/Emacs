;;; Various language settings.

(require 'my-pre)
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
;;-------------------------------------------------------------------------------
;; dockfile
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
;;-------------------------------------------------------------------------------
;; rust
(add-to-list 'load-path (expand-lang-path "rust-mode"))
(require 'rust-mode-autoloads)
;;-------------------------------------------------------------------------------
;; R
(add-to-list 'load-path (expand-lang-path "ess/lisp"))
(load "ess-site")
;;------------------------------------------------------------------------------
(provide 'small-lang)
