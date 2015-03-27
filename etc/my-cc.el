
(require 'my-pre)
(add-to-list 'load-path "~/Emacs/etc/cpp")
(add-to-list 'load-path (expand-lang-path "cpp"))
(add-to-list 'load-path (expand-lang-path "cpp/helm-gtags"))
(add-to-list 'load-path (expand-lang-path "cpp/company-c-headers"))
(add-to-list 'load-path (expand-meta-path "ggtags"))

(require 'setup-helm)
; install global package on linux,use gtags command to produce project tags.
(require 'setup-helm-gtags)
;; (require 'setup-ggtags)
(require 'setup-cedet)

;; function-args
;(require 'function-args)
;(fa-config-default)
;(define-key c-mode-map  [(tab)] 'moo-complete)
;(define-key c++-mode-map  [(tab)] 'moo-complete)



;; company-c-headers
(add-to-list 'company-backends 'company-c-headers)
(define-key c-mode-base-map (kbd "C-<tab>") 'company-c-headers)
;(add-to-list 'company-c-headers-path-system
;             "/usr/include/c++/4.9.1/"
;             )

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq
 c-default-style "k&r" ;; set style to "linux"
 )

(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; Package: clean-aindent-mode
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: dtrt-indent
;(require 'dtrt-indent)
;(dtrt-indent-mode 1)

;; Package: ws-butler
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

;; Package: yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Package: smartparens
;(require 'smartparens-config)
;(show-smartparens-global-mode +1)
;(smartparens-global-mode 1)

(defun my-c-mode-common-hook()
   (setq c-basic-offset 4)
   (c-set-offset 'inline-open 0)
   (c-set-offset 'friend '-)
   (c-set-offset 'substatement-open 0)
   )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

; clang async


(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/Emacs/bin/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)

(provide 'my-cc)
