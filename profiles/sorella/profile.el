(sa/use-packages ahg
                 anything
                 anything-config
                 bookmark+
                 circe
                 clojure-mode
                 clojurescript-mode
                 coffee-mode
                 color-theme-solarized
                 dart-mode
                 deft
                 desktop
                 diff-hl
                 ebib
                 fastnav
                 gist
                 haskell-mode
                 htmlize
                 jade-mode
                 js2-mode
                 json-mode
                 lua-mode
                 markdown-mode
                 magit
                 org
                 paredit
                 perspective
                 php-mode
                 projectile
                 puppet-mode
                 pymacs
                 rainbow-mode
                 scala-mode
                 slime
                 slime-js
                 slime-repl
                 smex
                 tss
                 tuareg
                 twittering-mode
                 typed-clojure-mode
                 wakatime-mode
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
               "purr-mode"
               "zencoding")

;; ------------------------------------------------------------------------
;; Load modules
;;------------------------------------------------------------------------

;; Utilities
(load "utils/all")

;; Main configuration
(load "sorella/emacs")
(load "sorella/bookmarks")
(load "sorella/versioning")

;; Programming / Modes
(load "sorella/org")
(load "sorella/irc")
(load "sorella/twittering")
(load "sorella/programming/all")

;; Keybindings
(load "sorella/keybindings")
