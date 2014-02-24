;cedet main semantic
;-------------------------------------------------------------------
(load-file "~/.emacs.d/cedet/cedet-devel-load.el")
;(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
(global-ede-mode 1)
;(global-semanticdb-minor-mode 1)
;(global-set-key [f5] 'speedbar)

(global-srecode-minor-mode 1)
(global-semantic-highlight-func-mode 1)
(global-semantic-idle-local-symbol-highlight-mode 1)
(global-semantic-idle-scheduler-mode 1)
;(global-semantic-idle-completions-mode 1)

(semantic-mode 1)

(require 'semantic/ia)
(require 'semantic/bovine/gcc)
(require 'semantic/bovine/c)


(setq semanticdb-default-save-directory "~/.emacs.d/include")

(semantic-load-enable-code-helpers)
(semantic-load-enable-minimum-features)
;(semantic-load-enable-gaudy-code-helpers)
;(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)

(global-set-key [f7] 'semantic-ia-fast-jump)


(defun my-semantic-hook ()
    (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)


;(setq qt-base-dir "/usr/include/qt")
;(semantic-add-system-include qt-base-dir 'c++-mode)
;(add-to-list 'auto-mode-alist (cons qt-base-dir 'c++-mode))
;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt-base-dir "/QtCore/qconfig.h"))
;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt-base-dir "/QtCore/qconfig-dist.h"))
;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt-base-dir "/QtCore/qglobal.h"))

(defun my-cedet-hook ()
    (local-set-key [(control tab)] 'semantic-ia-complete-symbol-menu)
      (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
        (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
	  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'my-cedet-hook)

;(defun my-c-mode-cedet-hook ()
;   (local-set-key "." 'semantic-complete-self-insert)
;    (local-set-key ">" 'semantic-complete-self-insert))
;(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)


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


;scope
;load in c/c++ mode
(add-hook 'c-mode-common-hook
	    '(lambda ()
	    (require 'xcscope)))


;
;
(provide 'my-cedet-semantic)

