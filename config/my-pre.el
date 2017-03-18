;;; Settings need to be load first

;;------------------------------------------------------------------------------
;; compile all el files
;;(byte-recompile-directory (expand-file-name "~/Emacs") 0)
;;------------------------------------------------------------------------------
;; paths
(setq util-path "~/Emacs/packages")
(setq gui-path "~/Emacs/gui/")

;; dash lib
;;(eval-after-load "dash" '(dash-enable-font-lock))
;;------------------------------------------------------------------------------
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
;;------------------------------------------------------------------------------
;; urls
(global-set-key "\C-c\C-z." 'browse-url-at-point)
(global-set-key "\C-c\C-zb" 'browse-url-of-buffer)
(global-set-key "\C-c\C-zr" 'browse-url-of-region)
(global-set-key "\C-c\C-zu" 'browse-url)
(global-set-key "\C-c\C-zv" 'browse-url-of-file)
(add-hook 'dired-mode-hook
		  (lambda ()
            (local-set-key "\C-c\C-zf" 'browse-url-of-dired-file)))
;;------------------------------------------------------------------------------

;; imenu
(setq imenu-auto-rescan t)
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "Imenu") (error nil)))
 (add-hook 'font-lock-mode-hook 'try-to-add-imenu)
;;-------------------------------------------------------------------------------
;;(add-to-list 'load-path (expand-meta-path "clean-aindent-mode")) 
;;(add-to-list 'load-path (expand-meta-path "dtrt-indent"))
;;(add-to-list 'load-path (expand-meta-path "ws-butler"))
;;-------------------------------------------------------------------------------
;; yasnippet
;;(add-to-list 'load-path (expand-meta-path "yasnippet"))
;;(require 'yasnippet)
;;(setq yas-snippet-dirs '("~/Emacs/usr/yasnippet/snippets"))
;;(defalias 'yas/get-snippet-tables 'yas--get-snippet-tables)
;;(defalias 'yas/table-hash 'yas--table-hash)
;;(yas-global-mode 1)
;;(define-key yas-minor-mode-map (kbd "C-c d") 'yas-expand)


;;(define-key yas-minor-mode-map (kbd "<tab>") nil)
;;(define-key yas-minor-mode-map (kbd "TAB") nil)
;;-------------------------------------------------------------------------------
;; cscope
;;(require 'xcscope)
;;(setq exec-path (append '("~/Emacs/bin")
;;						exec-path))
;;(add-to-list 'exec-path "~/Software/bin")

;;(global-set-key (kbd "C-c s s") 'cscope-find-this-symbol)
;;(global-set-key (kbd "C-c s a") 'cscope-set-initial-directory)
;;(global-set-key (kbd "C-c s I") 'cscope-index-files)
;;(global-set-key (kbd "C-c s c") 'cscope-find-functions-calling-this-function)
;;(global-set-key (kbd "C-c s C") 'cscope-find-called-functions)
;;------------------------------------------------------------------------------
;; flycheck
;;(add-hook 'after-init-hook #'global-flycheck-mode)
;;------------------------------------------------------------------------------
;; mark
(define-key  global-map  "\C-xm"  'pop-to-mark-command)
;;------------------------------------------------------------------------------
;; freq use commands
(define-key global-map "\C-xg" 'customize-group)
(define-key global-map "\C-xp" 'package-install)

(global-set-key (kbd "C-c f a") 'beginning-of-defun)
(global-set-key (kbd "C-c f e") 'end-of-defun)
(global-set-key (kbd "C-c f h") 'mark-defun)
;;------------------------------------------------------------------------------
;; golbal vars
(setq stack-trace-on-error t)
(prefer-coding-system 'utf-8-unix)
(setq max-lisp-eval-depth 10000)
;;------------------------------------------------------------------------------
;; meta keys
;; Keybonds
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)]
                (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)

;; mac switch meta key
(defun mac-switch-meta nil 
  "switch meta between Option and Command"
  (interactive)
  (if (eq mac-option-modifier nil)
      (progn
	(setq mac-option-modifier 'meta)
	(setq mac-command-modifier 'hyper)
	)
    (progn 
      (setq mac-option-modifier nil)
      (setq mac-command-modifier 'meta)
      )
    )
  )


;; copy thing
(require 'thing-edit)
(global-set-key (kbd "C-c s") 'thing-copy-line)
(provide 'my-pre)


