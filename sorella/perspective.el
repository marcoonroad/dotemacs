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

     
     ;;; Custom perspectives
     (defun sa/persp-org ()
       (interactive)
       (sa/custom-persp "@org"
                        (find-file (car org-agenda-files))    
                        (org-agenda-list)))


     ;;; Initialisation
     (persp-mode)

     ;;; Keybindings
     (global-set-key "\C-xp" 'persp-switch)

     (global-set-key "\C-cpo" 'sa/persp-org)
     ))
