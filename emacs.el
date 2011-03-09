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
            "coffee-mode"
            "jade-mode"
            "js2-mode"
            "markdown-mode"
            "pymacs"
            "renpy"
            "tumble"
            "twittering-mode"
            "whitespace"
            "yasnippet"
            "anything")


;; --[ load stuff ]------------------------------------------------------------
(require 'pymacs)           ; python bindings for emacs-lisp
(require 'yasnippet)        ; small code snippets
(require 'tumble)           ; tumblr blogging platform client
(require 'renpy)            ; Ren'Py mode, ohai
(require 'whitespace)       ; For tab visualization
(require 'ahg)              ; mercurial gawdness
(require 'twittering-mode)  ; tweets
(require 'jade-mode)
(require 'coffee-mode)
(require 'color-theme)
(require 'anything)


;; --[ Autoload ]--------------------------------------------------------------
(autoload 'js2-mode       "js2"           nil t)
(autoload 'markdown-mode  "markdown-mode" nil t)

;; Pymacs stuff
(autoload 'pymacs-apply  "pymacs")
(autoload 'pymacs-call   "pymacs")
(autoload 'pymacs-eval   "pymacs" nil t)
(autoload 'pymacs-exec   "pymacs" nil t)
(autoload 'pymacs-load   "pymacs" nil t)
(autoload 'rebox-comment "rebox"  nil t)
(autoload 'rebox-region  "rebox"  nil t)


;; --[ Automodes ]-------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.coffee$"      . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile"        . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.scss$"        . css-mode))
(add-to-list 'auto-mode-alist '("\\.js\\(on\\)?$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.md$"          . markdown-mode))


;; --[ YaSnippet ]-------------------------------------------------------------
(yas/load-directory "~/.emacs.d/cfg/snippets")


;; --[ custom stuff ]----------------------------------------------------------
(quietly-read-abbrev-file "~/.emacs.d/.abbrevs")
(load "sorella/profile")


;; --[ start server ]----------------------------------------------------------
(server-start)

