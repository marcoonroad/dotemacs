;; ----------------------------------------------------------------------------
;; Configuration for JS2-Mode
;; ----------------------------------------------------------------------------

;; Having parens, braces and brackets being automatically added is something
;; that really annoys and confuses me, thus I leave it disabled.
(setq js2-mirror-mode nil)

;; My JavaScript coding style involves leaving out all the noises I can to
;; improve readability. That means relying on ASI, omitting extraneous braces
;; and such. The strict-missing-semi-warning warns against ALL semicolons that
;; you don't put after each statement, so it just doesn't work for me.
(setq js2-strict-missing-semi-warning nil)

;; Lets preprocessor directives be treated as comments, as they should.
(setq js2-skip-preprocessor-directives t)

;; Doesn't allows keywords to be used as property names. There's nothing wrong
;; in setting them in a string, but some browsers will choke if you set them
;; with the usual JSObject notation.
(setq js2-allow-keywords-as-property-names nil)

;; Highlights external variables by default
(setq js2-highlight-external-variables t)


;; Mode-dependent configurations
(add-hook 'js2-mode-hook
		  (lambda ()
			;; Style for boxed comments
			(make-local-variable 'rebox-default-style)
			(setq rebox-default-style 243)

			;; Enables sending stuff directly to Conkeror
			(moz-minor-mode 1)))


;; ----------------------------------------------------------------------------
;; Utility functions
;; ----------------------------------------------------------------------------
(defun js2-toggle-external-warnings ()
  "Allows warnings for global variables to be toggled on/off.

Really useful for when editing configuration for Conkeror or some Node
scripts."
  (interactive)
  (setq js2-highlight-external-variables
		(not js2-highlight-external-variables))
  (js2-mode)) ; reloads the mode to apply the new configuration


;; ----------------------------------------------------------------------------
;; Shortcut keys
;; ----------------------------------------------------------------------------
(add-hook 'js2-mode-hook
		  (lambda ()
			; Uses tab as self insert, and C-TAB for js2-mode's indent
			(local-set-key (kbd "<C-tab>") 'indent-for-tab-command)
			(local-set-key      "\t"       'self-insert-command)
			
			; Toggle highlighting assigning to global vars
			(local-set-key "\C-ce"    'js2-toggle-external-warnings)

			; Rebox the comment at the cursor
			(local-set-key "\M-q" 'rebox-comment)

			; Moz-repl stuff
			(local-set-key "\C-x\C-e" 'js-send-last-sexp)
			(local-set-key "\C-\M-x"  'js-send-last-sexp-and-go)
			(local-set-key "\C-cb"    'js-send-buffer)
			(local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
			(local-set-key "\C-cl"    'js-load-file-and-go)))
