;cedet main semantic
;-------------------------------------------------------------------
(defun my-cc-mode-hook ()
  (add-to-list 'load-path (expand-meta-path "cedet"))
  (load-file (expand-meta-path "cedet/cedet-devel-load.el"))
  (setq semanticdb-default-save-directory "~/Emacs/data/include")

  (global-ede-mode 1)

  (global-srecode-minor-mode 1)
  (global-semantic-highlight-func-mode 1)
  (global-semantic-idle-local-symbol-highlight-mode 1)
  (global-semantic-idle-scheduler-mode 1)
  
  (semantic-mode 1)

  (require 'semantic/ia)
  (require 'semantic/bovine/gcc)
  (require 'semantic/bovine/c)

  (semantic-load-enable-code-helpers)
  (semantic-load-enable-minimum-features)


  (local-set-key [f7] 'semantic-ia-fast-jump)
  (local-set-key [(control tab)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)

  (defun my-semantic-hook ()
    (imenu-add-to-menubar "TAGS"))
  (add-hook 'semantic-init-hooks 'my-semantic-hook)

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
	(semantic-add-system-include dir 'c++-mode)
	(semantic-add-system-include dir 'c-mode))
        cedet-sys-include-dirs)
  
  )

(add-hook 'c-mode-common-hook 'my-cc-mode-hook)

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
(provide 'my-cedet-semantic)

