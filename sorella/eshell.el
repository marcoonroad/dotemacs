;; ----------------------------------------------------------------------------
;; EShell stuff
;; ----------------------------------------------------------------------------

(defun eshell/hg-prompt (&rest args)
  (eshell-do-eval
   (eshell-parse-command
    (concat "hg prompt \""
            "{ on {branch}}"
            "{ at {bookmark}}"
            "{{status}}"
            "\" 2> /dev/null")) t))

(setq eshell-prompt-function
      (lambda ()
        (concat "\n"   (or (getenv "USER") user-login-name)
                " at " (or (getenv "HOSTNAME") system-name)
                " in " (eshell/pwd)
                (eshell/hg-prompt) "\n"
                (if (= (user-uid) 0) "# " "$ "))))

