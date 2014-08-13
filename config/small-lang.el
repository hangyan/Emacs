;python
(add-to-list 'load-path "~/Emacs/python-mode")
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
;------------------------------------------------------------------------------




;xml
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
;(add-to-list 'load-path "~/Emacs/pgxml")
(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)
;(setq auto-mode-alist (append '(("/*.\.xml$" . sgml-mode)) auto-mode-alist))



;;php
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))


;javacc
(autoload 'javacc-mode "javacc-mode.el" "JavaCC mode." t)
(setq auto-mode-alist (append '(("/*.\.jj[t]?$" . javacc-mode)) auto-mode-alist))

;The new language----EE
;(autoload 'ee-mode "ee-mode.el" "EE mode." t)
;(setq auto-mode-alist (append '(("/*.\.ee$" . ee-mode)) auto-mode-alist))

;steve
;(autoload 'steve-mode "steve-mode.el" "Steve mode." t)
;(setq auto-mode-alist (append '(("/*.\.tz$" . steve-mode)) auto-mode-alist))


;asm
;(load-file "~/Emacs/utility/gas-mode.el")
;(require 'gas-mode)
;(load-file "~/Emacs/utility/asm86-mode.el")


;ant
;(add-to-list 'auto-mode-alist '("\\.ant$" . ant-mode))



;antlr
;(autoload 'antlr-mode "antlr-mode" nil t)
;(setq auto-mode-alist (cons '("\\.g\\'" . antlr-mode) auto-mode-alist))


;markdown
(autoload 'markdown-mode "markdown-mode.el"
              "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;json avsc
(autoload 'json-mode "json-mode.el"
	  "Major mode for editing json/avsc files" t)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.avsc\\'" . json-mode))


;js
(add-to-list 'load-path "~/Emacs/elpa/js3-mode")
(autoload 'js3-mode "js3" nil  t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))



;brainfuck
;(require 'bf)


;pig
;(require 'pig-mode)


;perl
;(add-to-list 'load-path "~/Emacs/pde/lisp")
;(load "pde-load")



;;haskell-mode
;(add-to-list 'load-path "~/Emacs/haskell-mode/")
;(require 'haskell-mode-autoloads)
;(add-to-list 'Info-default-directory-list "~/Emacs/haskell-mode/")


;;golang
(add-to-list 'load-path "~/Emacs/go-mode/")
(require 'go-mode)
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-eldoc) 
(add-hook 'go-mode-hook 'go-eldoc-setup)





;;ocaml
(add-to-list 'load-path "~/Emacs/tuareg")
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(autoload 'tuareg-imenu-set-imenu "tuareg-imenu" 
	  "Configuration of imenu for tuareg" t)

(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
   (setq auto-mode-alist 
	         (append '(("\\.ml[ily]?$" . tuareg-mode)
			              ("\\.topml$" . tuareg-mode))
			                   auto-mode-alist))

;;erlang
(add-to-list 'load-path "~/Emacs/eproject")
(add-to-list 'load-path "~/Emacs/s")
(add-to-list 'load-path "~/Emacs/f")
(add-to-list 'load-path "~/Emacs/edts")
(setq edts-inhibit-package-check t)
(if (executable-find "elc")
    (require 'edts-start))

;; sql upcase.
(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)

(provide 'small-lang)

;;
;;(add-to-list 'load-path "~/Emacs/jdee/lisp")
;;(load "jde")
;;(autoload 'jde-mode "jde" "JDE mode" t)
;;(setq auto-mode-alist
;;    (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))



