(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

; system include path
(semantic-mode 1)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode)

;; file jump
(require 'semantic/ia)
(global-set-key [f7] 'semantic-ia-fast-jump)

(provide 'setup-cedet)
