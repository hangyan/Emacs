;;; my-python.el --- conf for python

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
;;   (require 'my-python)

;;; Code:

(eval-when-compile
  (require 'cl))


;(add-to-list 'load-path "~/Emacs/python-mode")
;(autoload 'python-mode "python-mode" "Python Mode." t)
;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(add-to-list 'load-path "~/Emacs/emacs-for-python")
(load-file "~/Emacs/emacs-for-python/epy-init.el")
; install 'pyflakes' via 'pip install --upgrade pyflakes'
(epy-setup-checker "pyflakes %f")
(global-hl-line-mode t)
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)

; pylookup -doc
(setq pylookup-dir "~/Emacs/pylookup")
(add-to-list 'load-path pylookup-dir)

;; load pylookup when compile time
(eval-when-compile (require 'pylookup))

;; set executable file and db file
(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))

;; set search option if you want
;; (setq pylookup-search-options '("--insensitive" "0" "--desc" "0"))

;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)

;; eg ./pylookup.py -u http://docs.python.org

(autoload 'pylookup-update "pylookup" 
  "Run pylookup-update and create the database at `pylookup-db-file'." t)



(add-hook 'python-mode-hook
          (lambda () (local-set-key  (kbd "C-c C-l")  #'pylookup-lookup-at-point)))


(provide 'my-python)
;;; my-python.el ends here
