(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

; system include path
(setq cedet-sys-include-dirs (list
                              "/usr/include"
                              "/usr/include/sys/"
                              "/usr/include/netinet"
                              "/usr/include/c++/4.8.0/"
                              "/usr/include/mysql"
                              "/usr/include/mysql++"
                              "/home/yuyan/loglib/Y_Loglib10/include"
                              ))
(mapc (lambda (dir)
        (semantic-add-system-include dir)
      cedet-sys-include-dirs))



(semantic-mode 1)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode)

(provide 'setup-cedet)
