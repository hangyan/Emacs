;------------------------------------------------------------------------------
;C/C++
;------------------------------------------------------------------------------

(require 'my-pre)
(add-to-list 'load-path (expand-lang-path "cpp"))

;-------------------------------------------------------------------------------
;(require 'cc-mode)
(global-set-key [f8] 'eshell)

(defun my-c-mode-common-hook()
	(setq c-basic-offset 4)
	(setq gdb-many-windows t)
	(global-set-key [f10] 'gdb)
	(c-set-offset 'inline-open 0)
	(c-set-offset 'friend '-)
	(c-set-offset 'substatement-open 0)

        (setq tab-width 4 indent-tabs-mode nil)
        (c-toggle-auto-hungry-state 0)

        (define-key c-mode-base-map [(return)] 'newline-and-indent)
        (define-key c-mode-base-map [(control \')] 'hs-toggle-hiding)
        (define-key c-mode-base-map [(meta \')] 'c-indenet-command)
        (setq c-macro-shrink-window-flag t)
        (setq c-macro-preprocessor "cpp")
        (setq c-macro-cppflags " ")
        (setq c-macro-prompt-flag t)
        (setq hs-minor-mode t)
	
	(require 'disaster)
	; require objdump,on mac use gobjdump(from binutils)  link
	(define-key c-mode-base-map (kbd "C-c d") 'disaster)
        )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;-------------------------------------------------------------------------------
(provide 'my-cpp)
