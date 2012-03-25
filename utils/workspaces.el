;;; utils/workspaces.el --- Utilities for managing workspaces.
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
