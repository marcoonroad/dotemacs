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
                   (let ((agenda-file (car org-agenda-files)))
                     (when agenda-file
                       (find-file agenda-file)))
                   (org-agenda-list)))


;;; Initialisation
(persp-mode 1)

;;; Keybindings
(global-set-key "\C-xp" 'persp-switch)
(global-set-key "\C-cpo" 'sa/persp-org)
