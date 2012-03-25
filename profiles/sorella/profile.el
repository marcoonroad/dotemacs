(sa/use-packages ahg
                 anything
                 anything-config
                 clojure-mode
                 clojurescript-mode
                 coffee-mode
                 color-theme-solarized
                 dart-mode
                 deft
                 gist
                 haskell-mode
                 htmlize
                 jade-mode
                 js2-mode
                 lua-mode
                 markdown-mode
                 org
                 perspective
                 pymacs
                 rainbow-mode
                 slime
                 slime-js
                 slime-repl
                 smex
                 twittering-mode
                 yaml-mode
                 yasnippet)

(sa/vendor-add "batch-mode"
               "bnf"
               "candy-chain"
               "dollphie"
               "js3-mode"
               "lorem-ipsum"
               "renpy"
               "visual-basic"
               "vbs-repl"
               "color-theme"
               "zencoding")

;; ------------------------------------------------------------------------
;; Load modules
;;------------------------------------------------------------------------

;; Utilities
(load "utils/text")
(load "utils/htmlise")
(load "utils/css")
(load "utils/workspaces")

;; Main configuration
(load "sorella/emacs")

;; Programming / Modes
(load "sorella/org")
(load "sorella/twittering")
(load "sorella/programming/javascript")

;; Keybindings
(load "sorella/keybindings")
