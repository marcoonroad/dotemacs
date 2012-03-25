(define-generic-mode 'dollphie-mode
  ;; Comments
  nil
  ;; Keyworkds
  nil
  ;; Font-locks
  '(("^ *\\(Function\\|Object\\|Trait\\|Interface\\|Property\\|Module\\|Package\\|Variable\\)"
     . 'font-lock-keyword-face)
    ("--.*"                  . 'font-lock-comment-face)
    ("^ *==.*"               . 'font-lock-doc-face)
    ("^ *::"                 . 'font-lock-constant-face)
    ("[|→.⋃<>]"              . 'font-lock-string-face) 
    ("[A-Z][[:alnum:]_]*"    . 'font-lock-type-face)
    ("[a-z][[:alnum:]-_$]*:" . 'font-lock-variable-name-face)
    )
  '("\\.doll")  ;; file names
  nil          ;; function hooks
  "Major mode for Dollphie documentation files.")

(provide 'dollphie-mode)