(defvar steve-keywords
  '("use" "define" "variables" "include"
    "if" "new" "foreach"  "return" "while" "for")
  "Steve keywords.")

(defvar steve-types
  '("int" "float"  "object" "list"
    )
  "Steve types")

(defvar steve-constants
  '("self" "super" "controller")
  "Steve constants")

(defvar steve-functions
  '("init" "iterate" "post-iterate" "destory")
  "Steve functions")
    
(defvar steve-keywords-regexp (regexp-opt steve-keywords 'words))
(defvar steve-type-regexp (regexp-opt steve-types 'words))
(defvar steve-functions-regexp (regexp-opt steve-functions 'words))
(defvar steve-constant-regexp (regexp-opt steve-constants 'words))

(setq steve-keywords nil)
(setq steve-types nil)
(setq steve-functions nil)
(setq steve-constants nil)



(setq steve-font-lock-keywords
      `(
	(,steve-keywords-regexp . font-lock-type-face)
	(,steve-constant-regexp . font-lock-constant-face)
	(,steve-functions-regexp . font-lock-function-name-face)
	(,steve-type-regexp . font-lock-keyword-face)))


(define-derived-mode steve-mode text-mode
  "Steve mode"
  "Major mode for editing Steve language..."
  
  (setq font-lock-defaults '((steve-font-lock-keywords)))
  
  (setq steve-keywords-regexp nil)
  (setq steve-type-regexp nil)
  (setq steve-functions-regexp nil)
  (setq steve-constant-regexp nil)

  
  (setq indent-tabs-mode nil)
  (setq default-tab-width 4)
  (setq tab-width 4)

)

(provide 'steve-mode)
