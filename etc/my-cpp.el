
(require 'my-pre)
(add-to-list 'load-path (expand-lang-path "cpp"))


(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq gdb-many-windows t)
(global-set-key [f10] 'gdb)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)


(c-toggle-auto-hungry-state 1)

(define-key c-mode-base-map [(return)] 'newline-and-indent)
(define-key c-mode-base-map [(control \')] 'hs-toggle-hiding)
(define-key c-mode-base-map [(meta \')] 'c-indent-command)
(setq c-macro-shrink-window-flag t)
(setq c-macro-preprocessor "cpp")
(setq c-macro-cppflags " ")
(setq c-macro-prompt-flag t)
(setq hs-minor-mode t)


(require 'disaster)
(define-key c-mode-base-map (kbd "C-c d") 'disaster)


(defun astyle-this-buffer (pmin pmax)
  (interactive "r")
  (shell-command-on-region pmin pmax
                           "astyle --style=kr -xk -xl" ;; add options here...
                           (current-buffer) t 
                           (get-buffer-create "*Astyle Errors*") t))


(require 'member-functions)
(autoload 'expand-member-functions "member-functions" "Expand C++ member function declarations" t)
(add-hook 'c++-mode-hook (lambda () (local-set-key "\C-cm" #'expand-member-functions)))
;(setq mf--source-file-extension "cpp")

(provide 'my-cpp)
