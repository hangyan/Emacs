;-------------------------------------------------------------------------------
; auto-complete  and company
(require 'my-pre)
;-------------------------------------------------------------------------------

; auto-complete
(add-to-list 'load-path (expand-meta-path "auto-complete"))
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories (expand-meta-path "auto-complete/ac-dict"))
(add-to-list 'ac-modes 'cmake-mode)
(define-key ac-mode-map  (kbd "M-/") 'auto-complete)
;-------------------------------------------------------------------------------
(defun my-ac-config ()
  (setq ac-clang-flags
        (mapcar(lambda (item)(concat "-I" item))
               (split-string
                "/usr/include/c++/4.9.1"
                )))

  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
;-------------------------------------------------------------------------------
;; clang source ,yasnippet source,c headers for c-mode.
(add-to-list 'load-path (expand-lang-path "cpp/ac-c-headers"))
(defun my-ac-cc-mode-setup ()
  (my-ac-config)
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;-------------------------------------------------------------------------------
(provide 'my-auto-complete)

