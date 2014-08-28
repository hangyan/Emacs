;-------------------------------------------------------------------------------
; auto-complete  and company

(require 'my-pre)

;-------------------------------------------------------------------------------
; company
;; company
(add-to-list 'load-path (expand-meta-path "company"))
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)


;-------------------------------------------------------------------------------
; auto-complete
;(add-to-list 'load-path (expand-meta-path "auto-complete"))
;(require 'auto-complete-config)
;(require 'auto-complete)
;(ac-config-default)
;(global-auto-complete-mode t)
;(add-to-list 'ac-dictionary-directories (expand-meta-path "auto-complete/ac-dict"))


;(ac-set-trigger-key "TAB")
;(setq ac-auto-start nil)
;;

;(require 'auto-complete-clang)
;(setq ac-auto-start nil)
;(setq ac-quick-help-delay 0.5)
;(define-key ac-mode-map  (kbd "M-/") 'auto-complete)
;-------------------------------------------------------------------------------
;; (defun my-ac-config ()
;;   (setq ac-clang-flags
;;         (mapcar(lambda (item)(concat "-I" item))
;;                (split-string
;;                 "
;; 		   /usr/lib/gcc/i686-pc-linux-gnu/4.8.0/../../../../include/c++/4.8.0
;; 		   /usr/lib/gcc/i686-pc-linux-gnu/4.8.0/../../../../include/c++/4.8.0/i686-pc-linux-gnu
;; 		   /usr/lib/gcc/i686-pc-linux-gnu/4.8.0/../../../../include/c++/4.8.0/backward
;; 		   /usr/lib/gcc/i686-pc-linux-gnu/4.8.0/include
;; 		   /usr/local/include
;; 		   /usr/include/sys
;; 		   /usr/include/netinet
;; 		   /usr/include/arpa
;; 		   /usr/lib/gcc/i686-pc-linux-gnu/4.8.0/include-fixed
;; 		   /usr/include/mysql
;; 		   /usr/include/mysql++
;; 		   /usr/include/boost
;; 		   /home/yuyan/loglib/Y_Loglib10/include
;; 		     "
;;                 )))

;;   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;;   (add-hook 'css-mode-hook 'ac-css-mode-setup)
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;   (global-auto-complete-mode t))
;; ;-------------------------------------------------------------------------------
;; ;; clang source ,yasnippet source,c headers for c-mode.
;; (add-to-list 'load-path (expand-lang-path "cpp/ac-c-headers"))
;; (defun my-ac-cc-mode-setup ()
;;   (my-ac-config)
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;-------------------------------------------------------------------------------
(provide 'my-auto-complete)

