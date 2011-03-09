;; ----------------------------------------------------------------------------
;; Configuration for Python editing
;; ----------------------------------------------------------------------------

(add-hook 'python-mode-hook 
          (lambda()
			(local-set-key      "\C-ch"    'ipython-lookup)
            (local-set-key (kbd "M-<tab>") 'anything-ipython-complete)))

(add-hook 'ipython-complete
		  (lambda ()
			(locals-set-key (kbd "M-<tab>") 'anything-ipython-complete)))

(when (require 'anything-show-completion nil t)
  (use-anything-show-completion 'anything-ipython-complete
								'(length initial-pattern)))