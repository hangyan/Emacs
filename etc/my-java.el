;;; my-java.el --- java setttings

;; Copyright (C) 2014 Free Software Foundation, Inc.
;;
;; Author: Hang Yan <yayu@Hangs-MacBook-Air.local>
;; Maintainer: Hang Yan <yayu@Hangs-MacBook-Air.local>
;; Created: 18 Aug 2014
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
;;   (require 'my-java)

;;; Code:

(eval-when-compile
  (require 'cl))

(require 'my-pre)

(add-to-list 'load-path (expand-lang-path "java/javadoc-lookup"))
;-------------------------------------------------------------------------------
; malabar mode
; Note : 1. need javat-wy.el ,but my cedet not provide.download from others.
;        2. need groovy.
(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))
(semantic-mode 1)
(require 'malabar-mode)
(setq malabar-groovy-lib-dir "~/Emacs/data/java/jar/")
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))
;-------------------------------------------------------------------------------
; Javarun
(require 'javarun)
;-------------------------------------------------------------------------------
; add maven jars,need unzip and mvn command.
;   TODO: user async lib to fetch jars.
;   NOTE: Need `mvn` command
(add-to-list 'load-path (expand-lang-path "java/javadoc-lookup"))
(add-hook 'malabar-mode-hook
	  (lambda ()
	    (require 'javadoc-lookup)
	    (require 'maven-fetch)
	    (javadoc-add-artifacts 
		[org.apache.commons commons-math3 "3.0"]
		[log4j log4j 1.2.17])
            (javarun-mode 1)))

(add-hook 'malabar-mode-hook
          (lambda () (local-set-key (kbd "C-h j") 'javadoc-lookup) ))
;-------------------------------------------------------------------------------

(provide 'my-java)

;;; my-java.el ends here
