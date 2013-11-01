(defvar ee-keywords
  '("Environment" "EnvData" "EnvMessage"  "create"
    "Component" "receive" "from"  "call" "send" "to"
    "broadcast" "modify" "message" "const")
  "EE keywords.")

(defvar ee-types
  '("int" "float"  "string" "bool"
    "char")
  "EE types")

(defvar ee-constants
  '("TRUE" "FALSE")
  "EE constants")

(defvar ee-functions
  '("main" "run")
  "EE functions")
    
(defvar ee-keywords-regexp (regexp-opt ee-keywords 'words))
(defvar ee-type-regexp (regexp-opt ee-types 'words))
(defvar ee-functions-regexp (regexp-opt ee-functions 'words))
(defvar ee-constant-regexp (regexp-opt ee-constants 'words))

(setq ee-keywords nil)
(setq ee-types nil)
(setq ee-functions nil)
(setq ee-constants nil)



(setq ee-font-lock-keywords
      `(
	(,ee-keywords-regexp . font-lock-type-face)
	(,ee-constant-regexp . font-lock-constant-face)
	(,ee-functions-regexp . font-lock-function-name-face)
	(,ee-type-regexp . font-lock-keyword-face)))


(define-derived-mode ee-mode text-mode
  "EE mode"
  "Major mode for editing EE language..."
  
  (setq font-lock-defaults '((ee-font-lock-keywords)))
  
  (setq ee-keywords-regexp nil)
  (setq ee-type-regexp nil)
  (setq ee-functions-regexp nil)
  (setq ee-constant-regexp nil)

  
  (setq indent-tabs-mode nil)
  (setq default-tab-width 4)
  (setq tab-width 4)

)

(provide 'ee-mode)
