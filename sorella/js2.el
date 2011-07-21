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

;; Indentation
(setq js2-pretty-multiline-decl-indentation-p t)
(setq js2-bounce-indent-p t)

;; ----------------------------------------------------------------------------
;; Keys
;; ----------------------------------------------------------------------------
(add-hook 'js2-mode-hook
          (lambda ()
            (local-set-key "\C-cjh" 'js2-mark-defun)
            (local-set-key "\C-cje" 'js2-next-error)
            (local-set-key "\C-cjf" 'js2-mode-toggle-hide-functions)
            (local-set-key "\C-cjc" 'js2-mode-toggle-//-comment)
            (local-set-key "\C-cjt" 'js2-mode-toggle-element)
            (local-set-key (kbd "<backtab>") #'js2-indent-bounce-backwards)))
