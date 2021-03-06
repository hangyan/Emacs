;;; my-web.el --- web modes

;; Copyright (C) 2014 Free Software Foundation, Inc.
;;
;; Author: Hang Yan <yayu@Hangs-MacBook-Air.local>
;; Maintainer: Hang Yan <yayu@Hangs-MacBook-Air.local>
;; Created: 16 Aug 2014
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
;;   (require 'my-web)

;;; Code:

(eval-when-compile
  (require 'cl))

(require 'my-pre)


(add-to-list 'load-path (expand-lang-path "web-mode"))
(add-to-list 'load-path (expand-lang-path "rainbow-mode"))
;;-------------------------------------------------------------------------------
;;xml
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)
;;-------------------------------------------------------------------------------
;;php
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))
;;-------------------------------------------------------------------------------
;; http server
(add-to-list 'load-path (expand-lang-path "web-server"))
(require 'simple-httpd)
(setq httpd-root "~/Emacs/data/www")
;;(httpd-start)
;;-------------------------------------------------------------------------------
;;js
(add-to-list 'load-path (expand-lang-path "js2-mode"))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-to-list 'load-path (expand-lang-path "ac-js2"))
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)
;;-------------------------------------------------------------------------------
;; skewer
(add-to-list 'load-path (expand-lang-path "skewer-mode"))
(require 'skewer-mode)
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)
;;-------------------------------------------------------------------------------
;;html5
(add-to-list 'load-path (expand-lang-path "html5"))
(eval-after-load "rng-loc"
  '(add-to-list 'rng-schema-locating-files (expand-lang-path "html5/schemas.xml")))

;;(require 'whattf-dt)

;;-------------------------------------------------------------------------------
;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

(setq web-mode-enable-auto-pairing t
	  web-mode-enable-css-colorization t
	  web-mode-enable-current-element-highlight t)
;;-------------------------------------------------------------------------------
;; rainbow
(dolist (hook '(css-mode-hook
             html-mode-hook
			 web-mode-hook))
  (add-hook hook (lambda ()
				   (require 'rainbow-mode)
				   (rainbow-mode t))))
;;-------------------------------------------------------------------------------

(provide 'my-web)
;;; my-web.el ends here
