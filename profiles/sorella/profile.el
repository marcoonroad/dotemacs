(sa/use-packages ahg
                 anything
                 anything-config
                 bookmark+
                 clojure-mode
                 clojurescript-mode
                 coffee-mode
                 color-theme-solarized
                 dart-mode
                 deft
                 desktop
                 diff-hl
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
               "livescript-mode"
               "zencoding")

;; ------------------------------------------------------------------------
;; Load modules
;;------------------------------------------------------------------------

;; Utilities
(load "utils/all")

;; Main configuration
(load "sorella/emacs")
(load "sorella/bookmarks")

;; Programming / Modes
(load "sorella/org")
(load "sorella/twittering")
(load "sorella/programming/all")

;; Keybindings
(load "sorella/keybindings")
