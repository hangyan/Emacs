
;;;--------------------
;;;  auto-complete  ;;;


(require 'my-pre)
;;;----------------------------------------------------------------------------
(add-to-list 'load-path (expand-meta-path "auto-complete"))
(require 'auto-complete-config)
(require 'auto-complete)
(ac-config-default)
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories (expand-meta-path "auto-complete/ac-dict"))

;;;----------------------------------------------------------------------------



;;----------file ac-comphist.dat----------------- 
;;when a word is offen used,arrange it to the top of the candidates.


;;----------TAB as trigger key-------------------
;;if want to set TAB as trigger key(Trigger key will be enabled 
;;after inserting characters. Otherwise it is dealt as an usual command) 
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)
;;


;;-----------set user defines dict----------------
;;var:ac-user-dictionary-files
;;files seecified by ac-user-dictionary-files will be treated as dictonarg files .by 
;;default it is ~/.dict.
;;dictory file is a word list separated with newline
;;


;;----------myjor mode dictonary and extension dictonary
;;var:ac-dictionary-directories
;;As same as user defined dictionary, after editing and adding dictionary, 
;;you should do "M-x ac-clear-dictionary-cache" to apply changes.
;;


;;----------Source-------------------------------
;; list up sources with apropos "(M-x apropos RET ^ac-source-)"
;;
;;
;;
;;
;;
;;
;;

(require 'auto-complete-clang)
(setq ac-auto-start nil)  
(setq ac-quick-help-delay 0.5) 
(define-key ac-mode-map  (kbd "M-/") 'auto-complete)
;-------------------------------------------------------------------------------
(defun my-ac-config ()    
  (setq ac-clang-flags    
        (mapcar(lambda (item)(concat "-I" item))    
               (split-string    
                "    
		   /usr/lib/gcc/i686-pc-linux-gnu/4.8.0/../../../../include/c++/4.8.0
		   /usr/lib/gcc/i686-pc-linux-gnu/4.8.0/../../../../include/c++/4.8.0/i686-pc-linux-gnu
		   /usr/lib/gcc/i686-pc-linux-gnu/4.8.0/../../../../include/c++/4.8.0/backward
		   /usr/lib/gcc/i686-pc-linux-gnu/4.8.0/include
		   /usr/local/include
		   /usr/include/sys
		   /usr/include/netinet
		   /usr/include/arpa
		   /usr/lib/gcc/i686-pc-linux-gnu/4.8.0/include-fixed
		   /usr/include/mysql
		   /usr/include/mysql++
		   /usr/include/boost
		   /home/yuyan/loglib/Y_Loglib10/include
		     "  
                )))    

  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))    
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)    
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)    
  (add-hook 'css-mode-hook 'ac-css-mode-setup)    
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)    
  (global-auto-complete-mode t))
;;ac-source-gtags    
(my-ac-config)
;-------------------------------------------------------------------------------
;; clang source ,yasnippet source for c-mode.
(defun my-ac-cc-mode-setup ()    
    (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))    
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)    
;-------------------------------------------------------------------------------
;; ac source for c/c++ header files
(require 'auto-complete-c-headers)
(add-to-list 'ac-sources 'ac-source-c-headers)
;-------------------------------------------------------------------------------
;; auctex source
(require 'auto-complete-auctex)
;-------------------------------------------------------------------------------
(provide 'my-auto-complete)

