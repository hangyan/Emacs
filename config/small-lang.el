;python
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))
;------------------------------------------------------------------------------
;



;xml
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
;(add-to-list 'load-path "~/.emacs.d/pgxml")
(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)
;(setq auto-mode-alist (append '(("/*.\.xml$" . sgml-mode)) auto-mode-alist))
;
;
;

;;php
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))


;javacc
(autoload 'javacc-mode "javacc-mode.el" "JavaCC mode." t)
(setq auto-mode-alist (append '(("/*.\.jj[t]?$" . javacc-mode)) auto-mode-alist))

;The new language----EE
(autoload 'ee-mode "ee-mode.el" "EE mode." t)
(setq auto-mode-alist (append '(("/*.\.ee$" . ee-mode)) auto-mode-alist))

;steve
(autoload 'steve-mode "steve-mode.el" "Steve mode." t)
(setq auto-mode-alist (append '(("/*.\.tz$" . steve-mode)) auto-mode-alist))


;asm
(load-file "~/.emacs.d/utility/gas-mode.el")
(require 'gas-mode)
(load-file "~/.emacs.d/utility/asm86-mode.el")


;java load cedet
;(add-to-list 'load-path "~/.emacs.d/cedet/common")
;(load-file "~/.emacs.d/cedet/common/cedet.el")
;(add-to-list 'load-path "~/.emacs.d/jdee/lisp")
;(require 'jde)
;(defun screen-width nil -1)
;(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")


;ant
(add-to-list 'auto-mode-alist '("\\.ant$" . ant-mode))



;antlr
(autoload 'antlr-mode "antlr-mode" nil t)
(setq auto-mode-alist (cons '("\\.g\\'" . antlr-mode) auto-mode-alist))

;C#
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
    (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))



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
(add-to-list 'load-path "~/.emacs.d/elpa/js3-mode")
(autoload 'js3-mode "js3" nil  t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))



;brainfuck
(require 'bf)
(provide 'small-lang)

;;
;;(add-to-list 'load-path "~/.emacs.d/jdee/lisp")
;;(load "jde")
;;(autoload 'jde-mode "jde" "JDE mode" t)
;;(setq auto-mode-alist
;;    (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))

;pig
(require 'pig-mode)


;perl
(add-to-list 'load-path "~/.emacs.d/pde/lisp")
(load "pde-load")
