;; ----------------------------------------------------------------------------
;; Makes sure Emacs looks for our stuff in the right place.
;; ----------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/elpa")


;; ----------------------------------------------------------------------------
;; Adds vendor modules so they're also reachable by Emacs
;; ----------------------------------------------------------------------------
(defun vendor-add (&rest modules)
  (dolist (module modules)
    (add-to-list 'load-path (concat "~/.emacs.d/vendor/" module))))
    
(vendor-add "ac"
            "ahg"
            "coffee-mode"
            "jade-mode"
            "js2-mode"
            "js-comint"
            "markdown-mode"
            "moz"
            "pymacs"
            "rebox"
            "renpy"
            "tumble"
            "twittering-mode"
            "whitespace"
            "word-count"
            "xscheme"
            "yasnippet"
            "ipython"
            "python-mode"
            "anything"
			"pylookup"
)


;; --[ load stuff ]------------------------------------------------------------
(require 'pymacs)           ; python bindings for emacs-lisp
(require 'yasnippet)        ; small code snippets
(require 'js-comint)        ; javascript interpreter on Rhino
(require 'tumble)           ; tumblr blogging platform client
(require 'renpy)            ; Ren'Py mode, ohai
(require 'xscheme)          ; Emacs scheme from SICP <3
(require 'whitespace)       ; For tab visualization
(require 'ahg)              ; mercurial gawdness
(require 'word-count)       ; silliness, yay!
(require 'twittering-mode)  ; tweets
(require 'package)          ; ELisp package module
(require 'jade-mode)
(require 'coffee-mode)
(require 'color-theme)
(require 'python-mode)
(require 'ipython)
(require 'anything)
(require 'anything-ipython)



;; --[ Autoload ]--------------------------------------------------------------
(autoload 'js2-mode       "js2"           nil t)
(autoload 'moz-minor-mode "moz"           nil t)
(autoload 'markdown-mode  "markdown-mode" nil t)

;; Pymacs stuff
(autoload 'pymacs-apply  "pymacs")
(autoload 'pymacs-call   "pymacs")
(autoload 'pymacs-eval   "pymacs" nil t)
(autoload 'pymacs-exec   "pymacs" nil t)
(autoload 'pymacs-load   "pymacs" nil t)
(autoload 'rebox-comment "rebox"  nil t)
(autoload 'rebox-region  "rebox"  nil t)

;; Pylookup
(autoload 'pylookup-lookup "pylookup")
(autoload 'pylookup-update "pylookup")


;; --[ ELisp Packages ]--------------------------------------------------------
(package-initialize)


;; --[ Automodes ]-------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.coffee$"      . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile"        . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.scss$"        . css-mode))
(add-to-list 'auto-mode-alist '("\\.js\\(on\\)?$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.md$"          . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.py$"          . python-mode))


;; --[ Pylookup ]--------------------------------------------------------------
(setq pylookup-program "~/.emacs.d/pylookup/pylookup.py")
(setq pylookup-db-file "~/.emacs.d/cfg/pylookup/pylookup.db")


;; --[ YaSnippet ]-------------------------------------------------------------
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")


;; --[ custom stuff ]----------------------------------------------------------
(quietly-read-abbrev-file "~/.emacs.d/.abbrevs")
(load "sorella/profile")


;; --[ start server ]----------------------------------------------------------
(server-start)

