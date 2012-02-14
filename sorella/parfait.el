
(defun parfait-javascript ()
  (interactive)
  (make-local-variable 'parfait-symtable)
  (setq parfait-symtable '())
  (parfait-add-symbols
   '(;; Keywords
     ("\\<function\\>" . "λ")
     ("\\<return\\>" . "←")
     ("\\.prototype\\." . "#")
     ("this\\." . "@")

     ;; Identifier readability
     ("\\>_\\<" . "-")
     ("_p\\>" . "?")
     ("\\<n_\\([[:alnum:]_$]+\\)" . (lambda()
                                      (concat (match-string 1) "!")))
     ("_\\(_+\\)\\([[:alnum:]_$]+\\)" . (lambda()
                                          (let ((s (make-string (string-width (match-string 1)) ?')))
                                            (concat (match-string 2) s))))

     ;; Clutter-less blocks
     ("{" . "≡")
     ("){" . ") ≡")
     ("}" . "")
     ("{ *}" . "::")

     ;; Operators
     (" :\\(     ?\\)?" . " :")
     ("&&\\(     ?\\)?" . "⋀")
     ("||\\(     ?\\)?" . "⋁")

     ;; Operators
     ("\\.clone(" . " ⋖ ")  ;; Allen's proposal :3
     ("<=" . "≤")
     (">=" . "≥")
    ))
  (parfait-mode t))

;; Used for Dart
(defun parfait-java ()
  (interactive)
  (make-local-variable 'parfait-symtable)
  (make-local-variable 'tab-width)
  (setq tab-width         80)
  (setq parfait-symtable '())

  (parfait-add-symbols
   '(("\\<this\\."                                   . "@")
     ("\\>_\\<"                                      . "-")
     ("p[[:blank:]]*("                               . "?(")
     ("[{};]+[[:blank:]]*\\([{};]+[[:blank:]]*\\)?$" . "	↲")))
  (c-toggle-electric-state -1)
  (parfait-mode             t))

(add-hook 'js2-mode-hook        'parfait-javascript)
(add-hook 'js3-mode-hook        'parfait-javascript)
(add-hook 'javascript-mode-hook 'parfait-javascript)
(add-hook 'java-mode-hook       'parfait-java)
          
