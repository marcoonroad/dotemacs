;; ----------------------------------------------------------------------------
;; Loads all the customization stuff
;; ----------------------------------------------------------------------------
;; Base customization
(load "sorella/emacs")
(load "sorella/candy-chain-theme")
(load "sorella/spelling")
(load "sorella/vc")
(load "sorella/whitespace")


;; Major theme customizations
(load "sorella/c")
(load "sorella/coffee")
(load "sorella/html")
(load "sorella/js2")
(load "sorella/python")
(load "sorella/twittering")
(load "sorella/yasnippet")


;; Applies the colour theme
(color-theme-initialize)
(color-theme-candy-chain)