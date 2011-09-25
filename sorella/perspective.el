(eval-after-load 'perspective
  '(progn
     ;;; Helpers
     ;; Defines custom perspectives
     (defmacro sa/custom-persp (name &rest body)
       `(let ((initialize (not (gethash ,name perspectives-hash)))
              (current-perspective persp-curr))
          (persp-switch ,name)
          (when initialize ,@body)
          (setq persp-last current-perspective)))


     ;;; Initialisation
     (persp-mode)

     ;;; Useful keybindings
     (global-set-key "\C-xp" 'persp-switch)
     ))
