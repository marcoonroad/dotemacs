
(defun parfait-javascript ()
  (interactive)
  (make-local-variable 'parfait-symtable)
  (parfait-add-symbols
   '(("\\<this\\(\\.\\|\\>\\)" . "@")
     ("\\<return\\>"           . "⇐")
     ("\\<function\\>"         . "𝝺")
     ("\\>_\\<"                . "-")
     ("<="                     . "≤")
     (">="                     . "≥")
     ("&&"                     . "⋀")
     ("||"                     . "⋁")))
  (parfait-mode t))

(add-hook 'js2-mode-hook        'parfait-javascript)
(add-hook 'js3-mode-hook        'parfait-javascript)
(add-hook 'javascript-mode-hook 'parfait-javascript)
          
