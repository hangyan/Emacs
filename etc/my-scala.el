(require 'my-pre)

; scala mode
(add-to-list 'load-path (expand-lang-path "scala/scala-mode2"))
(require 'scala-mode2)


; ensime
(add-to-list 'load-path (expand-lang-path "scala/ensime"))
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;sbt
(add-to-list 'load-path (expand-lang-path "scala/sbt-mode"))
(require 'sbt-mode)

(provide 'my-scala)
