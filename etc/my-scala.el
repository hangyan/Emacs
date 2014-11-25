(require 'my-pre)

; scala mode
(add-to-list 'load-path (expand-lang-path "scala/scala-mode2"))
(require 'scala-mode2)


; ensime
(add-to-list 'load-path (expand-lang-path "scala/ensime"))
;(require 'ensime)
;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;sbt
(add-to-list 'load-path (expand-lang-path "scala/sbt-mode"))
(require 'sbt-mode)

(defun my-scala-mode-hook ()
  (add-to-list 'ac-sources 'ac-source-words-in-same-mode-buffers)
  (add-to-list 'ac-sources 'ac-source-dictionary)
  (setq ac-ignore-case nil))
(add-hook 'scala-mode-hook 'my-scala-mode-hook)

(provide 'my-scala)
