;------------------------------------------------------------------------------
;latex
;------------------------------------------------------------------------------
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-PDF-mode t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)


(require 'ac-math)
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
