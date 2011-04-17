;; ----------------------------------------------------------------------------
;; Loads all the customization stuff
;; ----------------------------------------------------------------------------
;; Base customization
(load "sorella/emacs")
(load "candy-chain-theme")
(load "sorella/spelling")
(load "sorella/vc")
(load "sorella/whitespace")


;; Major theme customizations
(load "sorella/c")
(load "sorella/coffee")
(load "sorella/html")
(load "sorella/js2")
(load "sorella/lisp")
(load "sorella/python")
(load "sorella/twittering")
(load "sorella/yasnippet")
(load "sorella/erc")
(load "sorella/org")
;(load "sorella/emms")


;; Applies the colour theme
(color-theme-candy-chain)


;; Silly stuff to allow me testing the changes I do without too much hassle
(defun candy-chain-reload-theme ()
  (interactive)
  (eval-buffer)
  (color-theme-candy-chain))

(global-set-key "\C-ct" 'candy-chain-reload-theme)
