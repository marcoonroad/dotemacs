;; ----------------------------------------------------------------------------
;; Loads all the customization stuff
;; ----------------------------------------------------------------------------
;; Base customization
(load "sorella/emacs")
(load "candy-chain-theme")
(load "sorella/spelling")
(load "sorella/vc")
(load "sorella/org-projects")

;; Utilities/minor modes
(load "sorella/whitespace")
;(load "sorella/smex")
(load "sorella/parfait")
(load "sorella/vline")
(load "sorella/deft")
(load "sorella/perspective")

;; Major mode customizations
(load "sorella/c")
(load "sorella/coffee")
(load "sorella/html")
(load "sorella/js2")
(load "sorella/js3")
(load "sorella/lisp")
(load "sorella/python")
(load "sorella/twittering")
(load "sorella/yasnippet")
(load "sorella/erc")
(load "sorella/org")
(load "sorella/markdown")
(load "sorella/visual-basic")
;(load "sorella/emms")

;; Private and system-specific configuration
(load "sorella/private/loader" 'noerror 'nomessage)

;; Applies the colour theme
(color-theme-candy-chain)


;; Silly stuff to allow me testing the changes I do without too much hassle
(defun candy-chain-reload-theme ()
  (interactive)
  (eval-buffer)
  (color-theme-candy-chain))

(global-set-key "\C-ct" 'candy-chain-reload-theme)
