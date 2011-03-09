;; ----------------------------------------------------------------------------
;; Coffee-mode utility functions
;; ----------------------------------------------------------------------------
(defun coffee-rebox-class-comment ()
  "Rebox comments for classes.

  # ------- #
  # Comment #
  # ------- #
"
  (interactive)
  (setq rebox-default-style 413)
  (rebox-comment '())
  (setq rebox-default-style 415))


;; ----------------------------------------------------------------------------
;; Configuration for Coffee-mode
;; ----------------------------------------------------------------------------

;; Binary for Coffee
(setq coffee-command (expand-file-name "~/.local/node/bin/coffee"))


;; Default style for comment reboxing uses hashes all around it
(add-hook 'coffee-mode-hook
		  (lambda ()
			(make-local-variable rebox-default-style)
			(setq rebox-default-style 415)))


;; ----------------------------------------------------------------------------
;; Shortcut keys
;; ----------------------------------------------------------------------------
(add-hook 'coffee-mode-hook
		  (lambda ()
			(local-set-key "\M-q"     'rebox-comment)
			(local-set-key "\C-c\M-q" 'coffee-rebox-class-comment)))