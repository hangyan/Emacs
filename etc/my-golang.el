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

(require 'my-pre)


(add-to-list 'load-path (expand-utility-path "deferred"))
(add-to-list 'load-path (expand-utility-path "helm"))

(if (eq system-type 'darwin)
    (progn
      (setenv "GOPATH" "/Users/yayu/Golang")
      (setq exec-path (append '("/Users/yayu/Golang/bin") exec-path)))      
  (setenv "GOPATH" "/home/yuyan/Golang"))


; NOTE: Don't use gocode from ubuntu.get it from github,and link
;       it to /usr/local/bin
(add-to-list 'load-path (expand-lang-path "go-mode"))

(require 'go-mode)
(require 'go-autocomplete)
(require 'auto-complete-config)

(require 'go-eldoc)
(go-eldoc-setup)

(require 'golint)

  ; go flymake
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


(provide 'my-golang)
;;; my-golang.el ends here
