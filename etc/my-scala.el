(require 'my-pre)

; ensime
(add-to-list 'load-path (expand-lang-path "scala/ensime"))
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;
(provide 'my-scala)
