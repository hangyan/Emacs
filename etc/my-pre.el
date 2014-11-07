;;; Settings need to be load first

; compile all el files
;(byte-recompile-directory (expand-file-name "~/Emacs") 0)
; paths
(setq meta-path "~/Emacs/usr/")
(setq utility-path "~/Emacs/opt/")
(setq lang-path "~/Emacs/dev/")
(setq gui-path "~/Emacs/gui/")

(defun expand-gui-path (sub)
  (concat gui-path sub))

(defun expand-meta-path (sub)
  (concat meta-path sub))

(defun expand-lang-path (sub)
  (concat lang-path sub))

(defun expand-utility-path (sub)
  (concat utility-path sub))

(add-to-list 'load-path (expand-lang-path "misc"))
(add-to-list 'load-path (expand-utility-path "misc"))

;-------------------------------------------------------------------------------
;windows
(if (eq system-type 'windows-nt)
	(progn
	  (setq explicit-shell-file-name "bash.exe") 
	  ;; For subprocesses invoked via the shell 
	  ;; (e.g., "shell -c command") 
	  (setq shell-file-name explicit-shell-file-name) 
	  ))
;-------------------------------------------------------------------------------
; redefine exist key
;; (if (eq system-type 'gnu/linux)
;; 	(progn
;; 	  (global-unset-key (kbd "C-x C-c"))
;; 	  (global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
;; 	  ))
;-------------------------------------------------------------------------------
; disable open large file promt
(setq large-file-warning-threshold nil)
; ------------------------------------------------------------------------------
; terminal or gui
(defun is-in-terminal()
      (not (display-graphic-p)))
; ------------------------------------------------------------------------------
; rename file and buffer
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive
   (progn
     (if (not (buffer-file-name))
         (error "Buffer '%s' is not visiting a file!" (buffer-name)))
     (list (read-file-name (format "Rename %s to: " (file-name-nondirectory
                                                     (buffer-file-name)))))))
  (if (equal new-name "")
      (error "Aborted rename"))
  (setq new-name (if (file-directory-p new-name)
                     (expand-file-name (file-name-nondirectory
                                        (buffer-file-name))
                                       new-name)
                   (expand-file-name new-name)))
  ;; If the file isn't saved yet, skip the file rename, but still update the
  ;; buffer name and visited file.
  (if (file-exists-p (buffer-file-name))
      (rename-file (buffer-file-name) new-name 1))
  (let ((was-modified (buffer-modified-p)))
    ;; This also renames the buffer, and works with uniquify
    (set-visited-file-name new-name)
    (if was-modified
        (save-buffer)
      ;; Clear buffer-modified flag caused by set-visited-file-name
      (set-buffer-modified-p nil))
	(message "Renamed to %s." new-name)))
; ------------------------------------------------------------------------------
; dash lib
(add-to-list 'load-path (expand-meta-path "dash"))
(eval-after-load "dash" '(dash-enable-font-lock))
; ------------------------------------------------------------------------------
; package manager
(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
             '("marmalade" . "http://marmalade-repo.org/packages/"))
;(package-initialize) ; 0.1 sec
; ------------------------------------------------------------------------------
; for view large pdfs
(defun my-find-file-check-make-large-file-read-only-hook ()
    "If a file is over a given size, make the buffer read only."
      (when (> (buffer-size) (* 1024 1024))
	    (setq buffer-read-only t)
	        (buffer-disable-undo)))

(add-hook 'find-file-hooks 'my-find-file-check-make-large-file-read-only-hook)
; ------------------------------------------------------------------------------
; urls
(global-set-key "\C-c\C-z." 'browse-url-at-point)
(global-set-key "\C-c\C-zb" 'browse-url-of-buffer)
(global-set-key "\C-c\C-zr" 'browse-url-of-region)
(global-set-key "\C-c\C-zu" 'browse-url)
(global-set-key "\C-c\C-zv" 'browse-url-of-file)
(add-hook 'dired-mode-hook
		  (lambda ()
            (local-set-key "\C-c\C-zf" 'browse-url-of-dired-file)))
; ------------------------------------------------------------------------------
; imenu
(setq imenu-auto-rescan t)
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "Imenu") (error nil)))
 (add-hook 'font-lock-mode-hook 'try-to-add-imenu)
;-------------------------------------------------------------------------------
; global componets
(add-to-list 'load-path (expand-meta-path "helm"))
(add-to-list 'load-path (expand-meta-path "function-args"))
(add-to-list 'load-path (expand-meta-path "company"))
(add-to-list 'load-path (expand-meta-path "clean-aindent-mode")) 
(add-to-list 'load-path (expand-meta-path "dtrt-indent"))
(add-to-list 'load-path (expand-meta-path "ws-butler"))
;-------------------------------------------------------------------------------
; yasnippet
(add-to-list 'load-path (expand-meta-path "yasnippet"))
(require 'yasnippet)
;(yas/load-directory (expand-meta-path "yasnippet/snippets"))
;(yas/initialize)

;-------------------------------------------------------------------------------
; cscope
(require 'xcscope)
(setq exec-path (append '("~/Emacs/bin")
                          exec-path))

(if (eq system-type 'darwin)
    (progn
      (define-key global-map [(meta f2)]  'cscope-set-initial-directory)
      (define-key global-map [(meta f3)]  'cscope-index-files)
      (define-key global-map [(meta f4)]  'cscope-find-this-symbol)
      (define-key global-map [(meta f5)]  'cscope-find-functions-calling-this-function)
      (define-key global-map [(meta f7)]  'cscope-find-this-file)
      (define-key global-map [(meta f8)] 'cscope-display-buffer-toggle)
      )
  (progn
    (define-key global-map [(control f2)]  'cscope-set-initial-directory)
    (define-key global-map [(control f3)]  'cscope-index-files)
    (define-key global-map [(control f4)]  'cscope-find-this-symbol)
    (define-key global-map [(control f5)]  'cscope-find-functions-calling-this-function)
    (define-key global-map [(control f7)]  'cscope-display-buffer)
    (define-key global-map [(control f8)] 'cscope-display-buffer-toggle)))

;; (define-key global-map [(control f3)]  'cscope-set-initial-directory)
;; (define-key global-map [(control f4)]  'cscope-unset-initial-directory)
;; (define-key global-map [(control f5)]  'cscope-find-this-symbol)
;; (define-key global-map [(control f6)]  'cscope-find-global-definition)
;; (define-key global-map [(control f7)]
;;   'cscope-find-global-definition-no-prompting)
;; (define-key global-map [(control f8)]  'cscope-pop-mark)
;; (define-key global-map [(control f9)]  'cscope-next-symbol)
;;  (define-key global-map [(control f10)] 'cscope-next-file)
;;  (define-key global-map [(control f11)] 'cscope-prev-symbol)
;;  (define-key global-map [(control f12)] 'cscope-prev-file)
;; (define-key global-map [(meta f9)]  'cscope-display-buffer)
;; (defin-ekey global-map [(meta f10)] 'cscope-display-buffer-toggle)


;-------------------------------------------------------------------------------
; flyspell,need install `'ispell` command and aspell-en package
;(setq flyspell-issue-message-flag nil)
;(dolist (hook '(text-mode-hook lisp-mode-hook emacs-lisp-mode-hook))
;  (add-hook hook (lambda () (flyspell-mode 1))))

;(dolist (hook '(c++-mode-hook c-mode-hook go-mode-hook))
;  (add-hook hook (lambda () (flyspell-prog-mode)))
;  )
;-------------------------------------------------------------------------------
; helm
;(require 'setup-helm)
;-------------------------------------------------------------------------------
; flymake
;(require 'flymake)
;(add-hook 'find-file-hook 'flymake-find-file-hook)
;-------------------------------------------------------------------------------
(provide 'my-pre)
