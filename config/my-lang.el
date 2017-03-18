;; Various language settings.
;;------------------------------------------------------------------------------
(require 'my-pre)
;;------------------------------------------------------------------------------
;; toml
;; (require 'toml-mode)
;;-------------------------------------------------------------------------------

;; (add-to-list 'auto-mode-alist '("\\.ant$" . ant-mode))
;;-------------------------------------------------------------------------------
;;markdown
;; (autoload 'markdown-mode "markdown-mode.el"
;;   "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; (setq markdown-css-dir "~/Emacs/data/markdown-css/")
;; (setq markdown-css-theme "clearness")
;;-------------------------------------------------------------------------------
;;json avsc
(autoload 'json-mode "json-mode.el"
  "Major mode for editing json/avsc files" t)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
;;(add-to-list 'auto-mode-alist '("\\.avsc\\'" . json-mode))
;;------------------------------------------------------------------------------
;; protobuf
(require 'protobuf-mode)
(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))
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
;; log files
;; (autoload 'log4j-mode "log4j-mode" "Major mode for viewing log files." t)
;; (add-to-list 'auto-mode-alist '("\\.log\\'" . log4j-mode))
;;-------------------------------------------------------------------------------
;; bash
;;(require 'bash-completion)
;;(bash-completion-setup)
(add-to-list 'auto-mode-alist '("zshrc" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
;;-------------------------------------------------------------------------------
;; dockfile
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
;;-------------------------------------------------------------------------------
;; rust
;; (add-to-list 'load-path (expand-lang-path "rust-mode"))
;; (require 'rust-mode-autoloads)
;; (add-to-list 'ac-modes 'rust-mode)

;;------------------------------------------------------------------------------
;; coffee
;; automatically clean up bad whitespace

;; (require 'coffee-mode)
;; (add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))
;; (setq whitespace-action '(auto-cleanup))
;; ;; only show bad whitespace
;; (setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))

;; ;; coffeescript
;; (custom-set-variables
;;  '(coffee-tab-width 2)
;;  '(coffee-args-compile '("-c" "--no-header" "--bare")))

;; (eval-after-load "coffee-mode"
;;   '(progn
;;      (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
;;      (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)))

;; (require 'flymake-coffee)
;; (add-hook 'coffee-mode-hook 'flymake-coffee-load)

;;------------------------------------------------------------------------------
;; prolog
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))

;; template
(auto-insert-mode)
(setq auto-insert-directory "~/Emacs/templates/")  ;; trailing slash IMPORTANT
(define-auto-insert "\.py" "python-template.py")
(setq auto-insert-query nil)


(provide 'my-lang)
