(defun is-in-terminal()
      (not (display-graphic-p)))

; dash
(add-to-list 'load-path "~/.emacs.d/dash")
(eval-after-load "dash" '(dash-enable-font-lock))

(provide 'my-pre)
