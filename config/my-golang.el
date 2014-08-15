;;; my-golang.el --- conf for golang

;; Copyright (C) 2014 Free Software Foundation, Inc.
;;
;; Author: Hang Yan <yayu@Hangs-MacBook-Air.local>
;; Maintainer: Hang Yan <yayu@Hangs-MacBook-Air.local>
;; Created: 15 Aug 2014
;; Version: 0.01
;; Keywords

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'my-golang)

;;; Code:

(eval-when-compile
  (require 'cl))



(if (eq system-type 'darwin)
    (progn
      (setenv "GOPATH" "/Users/yayu/Golang")
      (setq exec-path (append '("/Users/yayu/Golang/bin") exec-path)))      
  (setenv "GOPATH" "/home/yuyan/Golang"))


(add-to-list 'load-path "~/Emacs/go-mode/")
(require 'go-mode)
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-eldoc) 
(add-hook 'go-mode-hook 'go-eldoc-setup)


(require 'golint)

(setq goflymake-path "~/Golang/src/github.com/dougm/goflymake")
(if (file-exists-p goflymake-path)
    (progn 
      (add-to-list 'load-path goflymake-path)
      (require 'go-flymake)))

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))

(require 'helm-config)
(require 'helm-go-package)
;(setq helm-go-package-godoc-browse-url-function 'browse-url-text-emacs)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-l") 'helm-go-package)))

;(autoload 'helm-go-package "helm-go-package")
;(eval-after-load 'go-mode
;  '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

;(autoload 'helm-godoc "helm-godoc" nil t)
;(define-key go-mode-map (kbd "C-c C-d") 'helm-godoc)




(provide 'my-golang)
;;; my-golang.el ends here
