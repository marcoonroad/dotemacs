;; ----------------------------------------------------------------------------
;; Configuration for JS3-Mode
;; ----------------------------------------------------------------------------

;; Having parens, braces and brackets being automatically added is something
;; that really annoys and confuses me, thus I leave it disabled.
(setq js3-mirror-mode nil)

;; My JavaScript coding style involves leaving out all the noises I can to
;; improve readability. That means relying on ASI, omitting extraneous braces
;; and such. The strict-missing-semi-warning warns against ALL semicolons that
;; you don't put after each statement, so it just doesn't work for me.
(setq js3-strict-missing-semi-warning nil)

;; Lets preprocessor directives be treated as comments, as they should.
(setq js3-skip-preprocessor-directives t)

;; Doesn't allows keywords to be used as property names. There's nothing wrong
;; in setting them in a string, but some browsers will choke if you set them
;; with the usual JSObject notation.
(setq js3-allow-keywords-as-property-names nil)

;; Highlights external variables by default
(setq js3-highlight-external-variables t)

;; I find 4-space indentation the ideal.
(setq-default js3-indent-level 4)


;; ----------------------------------------------------------------------------
;; Keys
;; ----------------------------------------------------------------------------
(add-hook 'js3-mode-hook
          (lambda ()
            (local-set-key "\C-cjh" 'js3-mark-defun)
            (local-set-key "\C-cje" 'js3-next-error)
            (local-set-key "\C-cjf" 'js3-mode-toggle-hide-functions)
            (local-set-key "\C-cjc" 'js3-mode-toggle-//-comment)
            (local-set-key "\C-cjt" 'js3-mode-toggle-element)
            (local-set-key (kbd "<backtab>") #'js3-indent-bounce-backwards)))
