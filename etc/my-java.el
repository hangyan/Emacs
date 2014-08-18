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
(add-hook 'java-mode-hook
          (lambda ()
            (javarun-mode 1)))

;-------------------------------------------------------------------------------
; javadoc lookup
(require 'javadoc-lookup)
;-------------------------------------------------------------------------------
; auto-complete-java
; Need generated tag from CLASSPATH.output file is .java_base.tag
(add-to-list 'load-path (expand-lang-path "java/auto-java-complete"))
(require 'ajc-java-complete-config)
(add-hook 'java-mode-hook 'ajc-java-complete-mode)
(add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)



(provide 'my-java)

;;; my-java.el ends here
