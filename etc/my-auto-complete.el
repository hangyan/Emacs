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
(add-to-list 'ac-modes 'jde-mode)
(define-key ac-mode-map  (kbd "M-/") 'auto-complete)


(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)

(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")


(setq ac-source-yasnippet nil)

;-------------------------------------------------------------------------------
;; clang source ,yasnippet source,c headers for c-mode.
(add-to-list 'load-path (expand-lang-path "cpp/ac-c-headers"))
(defun my-ac-cc-mode-setup ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
(add-hook 'c++-mode-hook 'my-ac-cc-mode-setup)
;-------------------------------------------------------------------------------
; ac-sources
(add-to-list 'ac-sources 'ac-source-filename)
(add-to-list 'ac-sources 'ac-source-files-in-current-dir)
(add-to-list 'ac-sources 'ac-source-words-in-same-mode-buffers)
;-------------------------------------------------------------------------------

(provide 'my-auto-complete)

