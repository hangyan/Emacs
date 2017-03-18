;; ;;; my-python.el --- conf for python

;; ;; Copyright (C) 2014 Free Software Foundation, Inc.
;; ;;
;; ;; Author: Hang Yan <yayu@Hangs-MacBook-Air.local>
;; ;; Maintainer: Hang Yan <yayu@Hangs-MacBook-Air.local>
;; ;; Created: 15 Aug 2014
;; ;; Version: 0.01
;; ;; Keywords

;; ;; This program is free software; you can redistribute it and/or modify
;; ;; it under the terms of the GNU General Public License as published by
;; ;; the Free Software Foundation; either version 2, or (at your option)
;; ;; any later version.
;; ;;
;; ;; This program is distributed in the hope that it will be useful,
;; ;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; ;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; ;; GNU General Public License for more details.
;; ;;
;; ;; You should have received a copy of the GNU General Public License
;; ;; along with this program; if not, write to the Free Software
;; ;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;; ;;; Commentary:

;; ;; 

;; ;; Put this file into your load-path and the following into your ~/.emacs:
;; ;;   (require 'my-python)

;; ;;; Code:

(eval-when-compile
  (require 'cl))
(require 'my-pre)





;; (load-file (expand-lang-path "emacs-for-python/epy-init.el"))
;;  ;install 'pyflakes' via 'pip install --upgrade pyflakes'
;; (epy-setup-checker "flake8 %f")
;; (global-hl-line-mode t)
;; (require 'highlight-indentation)
;; (add-hook 'python-mode-hook 'highlight-indentation)
;; ;; load pylookup when compile time
;; (eval-when-compile (require 'pylookup))
;; ;; set executable file and db file
;; (setq pylookup-program (concat pylookup-dir "/pylookup.py"))
;; (setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))


;; (add-hook 'python-mode-hook
;;           (lambda () (local-set-key  (kbd "C-c C-l")  #'pylookup-lookup-at-point)))




;; ;; set search option if you want
;; ;; (setq pylookup-search-options '("--insensitive" "0" "--desc" "0"))

;; ;; to speedup, just load it on demand
;; (autoload 'pylookup-lookup "pylookup"
;;   "Lookup SEARCH-TERM in the Python HTML indexes." t)

;; ;; eg ./pylookup.py -u http://docs.python.org

;; (autoload 'pylookup-update "pylookup"
;;   "Run pylookup-update and create the database at `pylookup-db-file'." t)


;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; (setq interpreter-mode-alist
;;       (cons '("python" . python-mode)
;;             interpreter-mode-alist)
;;       python-mode-hook
;;       '(lambda () (progn
;;                     (set-variable 'py-indent-offset 4)
;;                     (set-variable 'indent-tabs-mode nil))))


;; (require 'python-pep8)
;; (require 'python-pylint)


;; ;; auto complete
(setq jedi:server-command '("/usr/local/bin/jediepcserver"))
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:setup-keys t)

(eval-after-load 'jedi
  '(progn
     (define-key jedi-mode-map (kbd "C-c .") nil)
     (define-key jedi-mode-map (kbd "C-c ,") nil)))

(setq jedi:key-goto-definition (kbd "C-c j"))
(setq jedi:key-goto-definition-pop-marker (kbd "C-c k"))



(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(provide 'my-python)
;; ;;; my-python.el ends here
