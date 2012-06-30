(defun sa/make-shell (name)
  (interactive "sShell name: ")
  (shell (concat "*shell<" name ">*")))
