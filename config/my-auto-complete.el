;;-------------------------------------------------------------------------------

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
;;(add-to-list 'ac-dictionary-directories (expand-meta-path "auto-complete/ac-dict"))
;;(add-to-list 'ac-modes 'cmake-mode)
;;(add-to-list 'ac-modes 'jde-mode)

(setq ac-source-yasnippet nil)


(define-key ac-mode-map  (kbd "M-/") 'auto-complete)


(add-to-list 'ac-sources 'ac-source-files-in-current-dir)
(add-to-list 'ac-sources 'ac-source-words-in-same-mode-buffers)
(add-to-list 'ac-sources 'ac-source-imenu)
(add-to-list 'ac-sources 'ac-source-words-in-buffer)
(add-to-list 'ac-sources 'ac-source-emacs-lisp-features)
(add-to-list 'ac-sources 'ac-source-symbols)



(define-key ac-mode-map (kbd "TAB") nil)
(define-key ac-completing-map (kbd "TAB") nil)
(define-key ac-completing-map [tab] nil)
;;-------------------------------------------------------------------------------

(provide 'my-auto-complete)

