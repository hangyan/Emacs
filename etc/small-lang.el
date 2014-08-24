;;; Various language settings.

(require 'my-pre)
(add-to-list 'load-path (expand-lang-path "misc"))

;javacc
(autoload 'javacc-mode "javacc-mode.el" "JavaCC mode." t)
(setq auto-mode-alist (append '(("/*.\.jj[t]?$" . javacc-mode)) auto-mode-alist))
;-------------------------------------------------------------------------------
;The new language----EE
;(autoload 'ee-mode "ee-mode.el" "EE mode." t)
;(setq auto-mode-alist (append '(("/*.\.ee$" . ee-mode)) auto-mode-alist))
;-------------------------------------------------------------------------------
;steve
;(autoload 'steve-mode "steve-mode.el" "Steve mode." t)
;(setq auto-mode-alist (append '(("/*.\.tz$" . steve-mode)) auto-mode-alist))
;-------------------------------------------------------------------------------
;asm
; Note : Should use regex
(defun my-asm-mode ()
  (when (and (stringp buffer-file-name)
             (or (string-match "\\.asm\\'" buffer-file-name)
				 (string-match "\\.s\\'" buffer-file-name)
				 (string-match "\\.S\\'" buffer-file-name)))

	(require 'gas-mode)
	(load-file (expand-lang-path "misc/asm86-mode.el"))
	))
(add-hook 'find-file-hook 'my-asm-mode)
;-------------------------------------------------------------------------------
;ant
(add-to-list 'auto-mode-alist '("\\.ant$" . ant-mode))
;-------------------------------------------------------------------------------
; gnuplot
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))
;-------------------------------------------------------------------------------
;markdown
(autoload 'markdown-mode "markdown-mode.el"
              "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(setq markdown-css-dir "~/Emacs/data/markdown-css/")
(setq markdown-css-theme "clearness")

;-------------------------------------------------------------------------------
;json avsc
(autoload 'json-mode "json-mode.el"
	  "Major mode for editing json/avsc files" t)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.avsc\\'" . json-mode))
;-------------------------------------------------------------------------------
;pig
(autoload 'pig-mode "pig-mode.el"
  "Major Mode for editing pig files" t)
(add-to-list 'auto-mode-alist '("\\.pig\\'" . pig-mode))
;-------------------------------------------------------------------------------
;perl
(add-to-list 'load-path (expand-lang-path "pde/lisp"))
(defun my-perl-pde-mode ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.pl\\'" buffer-file-name))
	(load "pde-load")
	(message "Load pde for perl...")
    ))

(add-hook 'find-file-hook 'my-perl-pde-mode)
;-------------------------------------------------------------------------------
;haskell-mode
;Note: need `make` first
(add-to-list 'load-path (expand-lang-path "haskell-mode/"))
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list (expand-lang-path "haskell-mode/"))
;-------------------------------------------------------------------------------
;ocaml
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
;-------------------------------------------------------------------------------
;erlang
(add-to-list 'load-path (expand-lang-path "erlang/eproject"))
(add-to-list 'load-path (expand-lang-path "erlang/s"))
(add-to-list 'load-path (expand-lang-path "erlang/f"))
(add-to-list 'load-path (expand-lang-path "erlang/edts"))
(setq edts-inhibit-package-check t)

(if (executable-find "elc")
	(require 'edts-start))
;-------------------------------------------------------------------------------
; sql upcase.
(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)
;-------------------------------------------------------------------------------
; yaml
(autoload 'yaml-mode "yaml-mode.el"
	  "Major mode for editing yml files" t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;-------------------------------------------------------------------------------
; lua
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
;-------------------------------------------------------------------------------

(provide 'small-lang)




