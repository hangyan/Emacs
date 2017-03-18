
(require 'my-pre)



(defun my-emacs-lisp-mode-hook ()
  (local-set-key  (kbd "C-c C-v")  #'eval-buffer)
  (setq tab-always-indent 'complete)
  (add-to-list 'completion-styles 'initials t)
  )
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'auto-complete-mode)





(provide 'my-elisp)


