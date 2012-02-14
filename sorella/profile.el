;; ----------------------------------------------------------------------------
;; Loads all the customization stuff
;; ----------------------------------------------------------------------------
;; Base customization
(load "sorella/emacs")
(load "candy-chain-theme")

(load "sorella/spelling")
(load "sorella/vc")

;; Utilities/minor modes
(load "sorella/deft")
(load "sorella/parfait")
(load "sorella/perspective")
;(load "sorella/smex")
;(load "sorella/vline")
(load "sorella/whitespace")

;; Major mode customizations
(load "sorella/c")
(load "sorella/coffee")
(load "sorella/css")
;(load "sorella/emms")
(load "sorella/erc")
(load "sorella/eshell")
(load "sorella/html")
(load "sorella/js2")
(load "sorella/js3")
(load "sorella/lisp")
(load "sorella/markdown")
(load "sorella/org")
(load "sorella/org-projects")
(load "sorella/python")
(load "sorella/twittering")
(load "sorella/visual-basic")
(load "sorella/yasnippet")

;; Private and system-specific configuration
(load "sorella/private/loader" 'noerror 'nomessage)

;; Applies the colour theme
(color-theme-candy-chain)


;; Silly stuff to allow me testing the changes I do without too much hassle
(global-set-key (kbd "<f12> d") 'color-theme-candy-chain)
(global-set-key (kbd "<f12> l") 'color-theme-solarized-light)
