;------------------------------------------------------------------------------
;C/C++
;------------------------------------------------------------------------------

(require 'my-pre)
(require 'my-utility)
(add-to-list 'load-path (expand-lang-path "cpp"))

;-------------------------------------------------------------------------------
(setq c-basic-offset 4)
(require 'cc-mode)
(setq gdb-many-windows t)
(global-set-key [f10] 'gdb)
(global-set-key [f8] 'eshell)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)


;(require 'google-c-style)
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)


(defun my-c-mode-common-hook()
        (setq tab-width 4 indent-tabs-mode nil)
        (c-toggle-auto-hungry-state 0)

        (define-key c-mode-base-map [(return)] 'newline-and-indent)
        ;(define-key c-mode-base-map [f9] 'compile)
        (define-key c-mode-base-map [(control \')] 'hs-toggle-hiding)
        (define-key c-mode-base-map [(meta \')] 'c-indenet-command)
        (setq c-macro-shrink-window-flag t)
        (setq c-macro-preprocessor "cpp")
        (setq c-macro-cppflags " ")
        (setq c-macro-prompt-flag t)
        (setq hs-minor-mode t)
        (setq abbrev-mode t)
        )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;-------------------------------------------------------------------------------
; disassembly c/c++ code at point
(require 'disaster)
; disater use objdump,on mac link gobjdump to objdump if not exists,
; gobjdump from binutils.
(define-key c-mode-base-map (kbd "C-c d") 'disaster)
;-------------------------------------------------------------------------------
; A Simple C++ Reference Viewer
(require 'cppref)
(setq cppref-doc-dir "~/Emacs/data/cpp-ref-doc")
;-------------------------------------------------------------------------------
(provide 'my-cpp)
