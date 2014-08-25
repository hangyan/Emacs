;;; ws-butler-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ws-butler-global-mode ws-butler-mode) "ws-butler"
;;;;;;  "ws-butler.el" (21498 37529 113493 655000))
;;; Generated autoloads from ws-butler.el

(autoload 'ws-butler-mode "ws-butler" "\
White space cleanup mode implemented on top of `highlight-changes-mode'.

With this mode in operation, it's not possible to rotate changes,
etc.

Change visibility can be toggled with
`highlight-changes-visible-mode', but changes get reset on every
save.

\(fn &optional ARG)" t nil)

(defvar ws-butler-global-mode nil "\
Non-nil if Ws-Butler-Global mode is enabled.
See the command `ws-butler-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ws-butler-global-mode'.")

(custom-autoload 'ws-butler-global-mode "ws-butler" nil)

(autoload 'ws-butler-global-mode "ws-butler" "\
Toggle Ws-Butler mode in all buffers.
With prefix ARG, enable Ws-Butler-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Ws-Butler mode is enabled in all buffers where
`ws-butler-mode' would do it.
See `ws-butler-mode' for more information on Ws-Butler mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("ws-butler-pkg.el") (21498 37529 234008
;;;;;;  222000))

;;;***

(provide 'ws-butler-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ws-butler-autoloads.el ends here
