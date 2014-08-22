;------------------------------------------------------------------------------
; Latex ,On mac should change the latex engine.
;------------------------------------------------------------------------------
(require 'my-pre)
(add-to-list 'load-path (expand-lang-path "latex"))
(add-to-list 'load-path (expand-lang-path "latex/auctex"))
(add-to-list 'load-path (expand-lang-path "latex/ac-auctex"))

(load "auctex.el" nil t t)
(load "font-latex.el" nil t t)


(require 'ac-math)
(load "preview-latex.el" nil t t)
(require 'auto-complete-auctex)

(setq TeX-PDF-mode t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(add-hook 'latex-mode-hook 'my-latex-mode-hook)





(add-to-list 'ac-modes 'latex-mode) 
(defun ac-latex-mode-setup ()   
    (setq ac-sources
	       (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
		                      ac-sources)))
(add-hook 'latex-mode-hook 'ac-latex-mode-setup)



(font-lock-add-keywords
     'latex-mode
        `((,(concat "^\\s-*\\\\\\("
		    "\\(documentclass\\|\\(sub\\)?section[*]?\\)"
		    "\\(\\[[^]% \t\n]*\\]\\)?{[-[:alnum:]_ ]+"
		    "\\|"
		    "\\(begin\\|end\\){document"
		    "\\)}.*\n?")
	          (0 'your-face append))))



(provide 'my-latex)
