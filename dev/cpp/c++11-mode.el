;;; c++11-mode.el
;;; Major mode for editing C++ code with support for the C++11 standard.

;; Author: Roy Crihfield
;; Maintainer: Roy
;; Created: 2014-01-10
;; Date: 2014-01-10
;; Version: 20140110
;; Keywords: C++ C++11 cc-mode

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

(eval-and-compile
  (c-add-language 'c++11-mode 'c++-mode))


;;; Keywords

;; Built-in basic types
(c-lang-defconst c-primitive-type-kwds
  c++11 (append '("char16_t" "char32_t")
                (c-lang-const c-primitive-type-kwds)))

;; Keywords that can prefix normal declarations of identifiers
(c-lang-defconst c-modifier-kwds
  c++11 (append '("thread_local" "noexcept")
                (c-lang-const c-modifier-kwds)))

;; These can occur almost anywhere in types but they don't build a type of
;; themselves.
(c-lang-defconst c-type-modifier-kwds
  c++11 (append '("constexpr")
                (c-lang-const c-type-modifier-kwds)))

;; Keywords that may be followed by a parenthesis expression that doesn't
;; contain type identifiers.
(c-lang-defconst c-paren-nontype-kwds
  c++11 (append '("decltype" "noexcept" "static_assert")
                (c-lang-const c-paren-nontype-kwds)))

;; Keywords for constants.
(c-lang-defconst c-constant-kwds
  c++11 (append '("nullptr")
                (c-lang-const c-constant-kwds)))

;; TODO: context-dependent keywords: final, override

;;;###autoload
(define-derived-mode c++11-mode c++-mode
  "Major mode for editing C++ code with support for the C++11 standard.
To submit a problem report, enter `\\[c-submit-bug-report]' from a
c++-mode buffer.  This automatically sets up a mail buffer with
version information already added.  You just need to add a description
of the problem, including a reproducible test case, and send the
message.

To see what version of CC Mode you are running, enter `\\[c-version]'.

The hook `c-mode-common-hook' is run with no args at mode
initialization, then `c++-mode-hook'.

Key bindings:
\\{c++-mode-map}"
  (c-initialize-cc-mode t)
  (set-syntax-table c++11-mode-syntax-table)
  (setq local-abbrev-table c++11-mode-abbrev-table
        abbrev-mode t)
  (use-local-map c++-mode-map)
  (c-init-language-vars c++11-mode)
  (c-common-init 'c++11-mode)
  (easy-menu-add c-c++-menu)
  (c-run-mode-hooks 'c-mode-common-hook 'c++11-mode-hook)
  (c-update-modeline))
