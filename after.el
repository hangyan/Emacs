;;; after cleanups 

;; auto-complete's popwin is broken
(setq popup-use-optimized-column-computation nil)



;; (defvar sanityinc/fci-mode-suppressed nil)
;; (defadvice popup-create (before suppress-fci-mode activate)
;;   "Suspend fci-mode while popups are visible"
;;   (when fci-mode
;;     (set (make-local-variable 'sanityinc/fci-mode-suppressed) t)
;;     (turn-off-fci-mode)))
;; (defadvice popup-delete (after restore-fci-mode activate)
;;   "Restore fci-mode when all popups have closed"
;;   (when sanityinc/fci-mode-suppressed
;;     (setq sanityinc/fci-mode-suppressed nil)
;;     (turn-on-fci-mode)))


(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))





(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-word (- arg)))

(defun backward-kill-char-or-word ()
  (interactive)
  (cond 
   ((looking-back (rx (char word)) 1)
    (backward-kill-word 1))
   ((looking-back (rx (char blank)) 1)
    (delete-horizontal-space t))
   (t
    (backward-delete-char 1))))


(global-set-key (read-kbd-macro "<M-DEL>") 'backward-kill-char-or-word)


(defun connect-azure ()
  (interactive)
  (dired "/alauda@139.217.3.183:/home/alauda/"))


;; ecb
(setq ecb-examples-bufferinfo-buffer-name "ecb-examples")

(setq ecb-minor-mode nil)
(defun display-buffer-at-bottom--display-buffer-at-bottom-around (orig-fun &rest args)
  "Bugfix for ECB: cannot use display-buffer-at-bottom', calldisplay-buffer-use-some-window' instead in ECB frame."
  (if (and ecb-minor-mode (equal (selected-frame) ecb-frame))
	  (apply 'display-buffer-use-some-window args)
	(apply orig-fun args)))
(advice-add 'display-buffer-at-bottom :around #'display-buffer-at-bottom--display-buffer-at-bottom-around)

(global-set-key (kbd "C-c b a") 'ecb-activate)
(global-set-key (kbd "C-c b d") 'ecb-deactivate)



;; grep
(require 'grep-o-matic)



;; spell
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(defun my-save-word ()
  (interactive)
  (let ((current-location (point))
		(word (flyspell-get-word)))
    (when (consp word)    
      (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location)
	  (message "Save the world..."))))

(global-set-key (kbd "C-c b p") 'my-save-word)


;; backup files
;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(provide 'after)

;;;
