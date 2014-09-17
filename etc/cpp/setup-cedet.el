(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)
(global-semantic-highlight-func-mode 1)
(global-semantic-idle-local-symbol-highlight-mode 1)

;(semantic-load-enable-code-helpers)

; system include path
(semantic-mode 1)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode)

;; file jump
(require 'semantic/ia)
(global-set-key [f7] 'semantic-ia-fast-jump)
;(global-set-key (kbd "C-.") 'semantic-ia-complete-symbol-menu)

; dbpath
(setq semanticdb-default-save-directory "~/Emacs/data/smdb")

; include path
(setq cedet-sys-include-dirs (list
                              "/usr/include"
                              "/usr/include/sys/"
                              "/usr/include/netinet"
                              "/usr/include/c++/4.9.1/"
                              "/usr/include/mysql"
                              "/usr/include/mysql++"
                              ))
(mapc (lambda (dir)
        (semantic-add-system-include dir 'c++-mode)
        (semantic-add-system-include dir 'c-mode))
      cedet-sys-include-dirs)


(provide 'setup-cedet)
