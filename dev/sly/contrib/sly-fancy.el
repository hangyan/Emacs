(require 'sly)

(define-sly-contrib sly-fancy
  "Make SLY fancy."
  (:authors "Matthias Koeppe  <mkoeppe@mail.math.uni-magdeburg.de>"
            "Tobias C Rittweiler <tcr@freebits.de>")
  (:license "GPL")
  (:sly-dependencies sly-mrepl
                     sly-autodoc
                     sly-fancy-inspector
                     sly-fancy-trace
                     sly-fuzzy
                     sly-scratch
                     sly-package-fu
                     sly-fontifying-fu
                     sly-trace-dialog
                     sly-profiler
                     sly-stickers
                     sly-indentation
                     sly-tramp))

(provide 'sly-fancy)
