;;; programming/javascript.el --- Settings for working with JavaScript

;; The configurations provided here aims to make Emacs a useful IDE for
;; editing JavaScript code, it also intends on helping with the
;; readability of JavaScript code, and to make it easier to format code
;; according to OrpheOS's guidelines.

;; Basically, customizations in style consist in:
;;
;;  - Comma-first style.
;;  - Abuse Automatic Semicolon Insertion.
;;  - No automagic code insertion, eletric indentation, etc.
;;  - 2 space structural indentation (Haskell/Lisp style)
;;
;; Besides that, we use `js3-mode' for real-time linting in JavaScript
;; files, but since `js3-mode' don't support JSON files, we fallback to
;; built-in `js-mode' for that.

(require 'js3-mode)


;; JS3-mode is used for all *real* javascript dev
(setq js3-mirror-mode                      nil  ;; No automatic paren insertion.
      js3-strict-missing-semi-warning      nil  ;; Yes ASI~.
      js3-skip-preprocessor-directives     t    ;; No CPP.
      js3-allow-keywords-as-property-names nil  ;; Not supported before ES5.
      js3-highlight-external-variables     t    ;; Catch some variable leaks.
      js3-indent-level                     2)

;; JS-mode is a fallback for JSON -.-
(setq js-indent-level     2
      js-auto-indent-flag nil)


;; ------------------------------------------------------------------------
;; Debugging
;; ------------------------------------------------------------------------
(defun sa/turn-on-slime-js-minor-mode ()
  (slime-js-minor-mode 1))


;; ------------------------------------------------------------------------
;; Syntax highlighting / mapping
;; ------------------------------------------------------------------------
(font-lock-add-keywords 'js3-mode
 '(("\\[\\|\\]\\|[{}(),.|&;\\?]" . font-lock-preprocessor-face)))


;; If parfait-mode is available, we define some mappings for it.
(when (require 'parfait-mode nil 'no-error)
  (defun parfait-javascript ()
    (interactive)
    (make-local-variable 'parfait-symtable)
    (setq parfait-symtable '())
    (parfait-add-symbols
     '(;; Keywords
       ("\\<function\\>" . "λ")
       ("\\<return\\>"   . "←")
       ("this\\."        . "@")

       ;; Identifier readability
       ("\\>_\\<"                . "٠")
       ("\\([a-z]\\)\\([A-Z]\\)" . (lambda ()
                                     (replace-match (match-string 1)
                                                    "٠"
                                                    (match-string 2))))

       ;; Operators
       ("&&"        . "⋀")
       ("||"        . "⋁")
       ("\\.derive" . "⊲")
       ("<="        . "≤")
       (">="        . "≥")
       )))

  (add-hook 'js3-mode-hook 'parfait-javascript))


;; ------------------------------------------------------------------------
;; Casing helpers
;; ------------------------------------------------------------------------
(when (boundp 'sa/turn-on-electric-case)
  (add-hook 'js3-mode-hook 'sa/turn-on-electric-case))


;; ------------------------------------------------------------------------
;; Auto-modes
;; ------------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.js$"   . js3-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))


;; ------------------------------------------------------------------------
;; Hooks
;; ------------------------------------------------------------------------
;(when (require 'slime-js nil 'no-error)
;  (add-hook 'js3-mode-hook 'sa/turn-on-slime-js-minor-mode))
