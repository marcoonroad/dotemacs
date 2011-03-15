;; ----------------------------------------------------------------------------
;; Makes sure Emacs looks for our stuff in the right place.
;; ----------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d")


;; ----------------------------------------------------------------------------
;; Adds vendor modules so they're also reachable by Emacs
;; ----------------------------------------------------------------------------
(defun vendor-add (&rest modules)
  (dolist (module modules)
    (add-to-list 'load-path (concat "~/.emacs.d/vendor/" module))))
    
(vendor-add "ahg"
            "batch-mode"
            "candy-chain"
            "clojure-mode"
            "coffee-mode"
            "jade-mode"
            "js2-mode"
            "markdown-mode"
            "pymacs"
            "renpy"
            "tumble"
            "twmode"
            "whitespace"
            "yasnippet"
            "anything"
            "slime")


;; --[ load stuff ]------------------------------------------------------------
(require 'yasnippet)        ; small code snippets
(require 'tumble)           ; tumblr blogging platform client
(require 'renpy)            ; Ren'Py mode, ohai
(require 'whitespace)       ; For tab visualization
(require 'ahg)              ; mercurial gawdness
(require 'twittering-mode)  ; tweets
(require 'color-theme)
(require 'anything)
(require 'slime)


;; --[ Autoload ]--------------------------------------------------------------
(autoload 'js2-mode       "build/js2-mode" nil t)
(autoload 'markdown-mode  "markdown-mode"  nil t)
(autoload 'batch-mode     "batch-mode"     nil t)
(autoload 'coffee-mode    "coffee-mode"    nil t)
(autoload 'jade-mode      "jade-mode"      nil t)
(autoload 'clojure-mode   "clojure-mode"   nil t)

;; Pymacs stuff
(autoload 'pymacs-apply  "pymacs")
(autoload 'pymacs-call   "pymacs")
(autoload 'pymacs-eval   "pymacs" nil t)
(autoload 'pymacs-exec   "pymacs" nil t)
(autoload 'pymacs-load   "pymacs" nil t)


;; --[ Automodes ]-------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.coffee$"      . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile"        . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.scss$"        . css-mode))
(add-to-list 'auto-mode-alist '("\\.js\\(on\\)?$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.md$"          . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.clj$"         . clojure-mode))

;; --[ YaSnippet ]-------------------------------------------------------------
(yas/load-directory "~/.emacs.d/cfg/snippets")


;; --[ custom stuff ]----------------------------------------------------------
(quietly-read-abbrev-file "~/.emacs.d/.abbrevs")
(load "sorella/profile")
