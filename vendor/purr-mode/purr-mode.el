;;; purr-mode.el --- Major mode for the Purr language

;; Copyright (C) 2014 Quildreen Motta

;; Version: 0.0.1
;; Keywords: Purr major mode
;; Author: Quildreen Motta <quildreen@gmail.com>
;; Url: http://github.com/robotlolita/purr-mode

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary

;; Fairly basic (for now) mode for Purr

;;; Code:
(setq purr-mode-keywords
      '("interface" "implement" "for" "method" "need" "derivation"
       "data" "match" "module" "use" "import" "with" "as"
       "let" "in" "where" "export" "ffi" "if" "then" "else" "do"
       "return" "all"))

(setq purr-mode-constants
      '("true" "false" "self"))

(setq purr-mode-keyword-regexp
  (regexp-opt purr-mode-keywords 'words))

(setq purr-mode-constant-regexp
  (regexp-opt purr-mode-constants 'words))

(setq purr-mode-special-symbol-regexp
  "\\.\\|{\\|}\\|;\\|(\\|)\\|\\(\\_<\\(->\\|<[|-]\\|=>\\||>\\|[_|]\\)\\_>\\)")

(setq purr-mode-string-regexp 
  "\"\\{3\\}\\(\\|\"\\{1,2\\}\\|[^\"]\\)*\"\\{3,\\}")

(setq purr-mode-keyword-app-regexp "\\b[^[:space:](){};._,$@^\n]*:")

(setq purr-mode-maybe-constructor-regexp "\\<[[:upper:]][^[:space:](){};._,$@^\n]*")

(setq purr-mode-variable-regexp "\\<$[^[:space:](){};._,$@^\n]*")

(setq purr-mode-font-lock-keywords
  `((,purr-mode-string-regexp . font-lock-string-face)
    (,purr-mode-keyword-app-regexp . font-lock-builtin-face)
    (,purr-mode-maybe-constructor-regexp . font-lock-type-face)
    (,purr-mode-variable-regexp . font-lock-variable-name-face)
    (,purr-mode-constant-regexp . font-lock-constant-face)
    (,purr-mode-keyword-regexp . font-lock-keyword-face)
    (,purr-mode-special-symbol-regexp . font-lock-comment-face)
    ))


(define-derived-mode purr-mode fundamental-mode
  "Purr"
  "Major mode for Purr"

  (setq font-lock-defaults '((purr-mode-font-lock-keywords)))
  
  (setq comment-start "#")
  (setq comment-end "")
  (modify-syntax-entry ?# "< b" purr-mode-syntax-table)
  (modify-syntax-entry ?\n "> b" purr-mode-syntax-table)
)

;;
;; On Load
;;

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.purr\\'" . purr-mode))

(provide 'purr-mode)
;;; purr-mode.el ends here
