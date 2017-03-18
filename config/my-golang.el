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

(setenv "GOPATH" "/Users/yayu/Golang")
(setq exec-path (append '("/Users/yayu/Golang/bin") exec-path))
;;-------------------------------------------------------------------------------
;; NOTE: Don't use gocode from ubuntu.get it from github,and link
;;       it to /usr/local/bin
;; godef repo: github.com/chenjianlong/rog-go/exp/cmd/godef
;;-------------------------------------------------------------------------------
(require 'go-autocomplete)
(require 'auto-complete-config)

(add-hook 'before-save-hook 'gofmt-before-save)
(require 'go-bimenu)

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-s") 'godoc-at-point)
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
                          (local-set-key (kbd "C-c C-k") 'godef-jump-back)
						  (local-set-key (kbd "C-c C-b") 'gobimenu-file)
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))




;;-------------------------------------------------------------------------------
(provide 'my-golang)
;;; my-golang.el ends here
