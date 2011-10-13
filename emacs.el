;; ----------------------------------------------------------------------------
;; Makes sure Emacs looks for our stuff in the right place.
;; ----------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d")


;; ----------------------------------------------------------------------------
;; Adds vendor modules so they're also reachable by Emacs
;; ----------------------------------------------------------------------------
(defun sa/vendor-add (&rest modules)
  (dolist (module modules)
    (add-to-list 'load-path (concat "~/.emacs.d/vendor/" module))))
    
(sa/vendor-add "ahg"
               "anything"
               "batch-mode"
               "bnf"
               "candy-chain"
               "clojure-mode"
               "coffee-mode"
               "color-theme"
               "deft"
               "ecb"
               "edje"
               "elib"
               "emacs-color-theme-solarized"
               "emms/lisp"
               "gist.el"
               "jade-mode"
               "jdee/lisp"
               "js2-mode"
               "js3-mode"
               "htmlize"
               "lambda"
               "lorem-ipsum"
               "lua-mode"
               "markdown-mode"
               "org-mode/lisp"
               "org-mode/contrib/lisp"
               "parfait"
               "perspective-el"
               "pymacs"
               "rainbow"
               "rainbow-delimiters"
               "renpy"
               "slime"
               "smex"
               "todochiku"
               "tumble"
               "twmode"
               "visual-basic"
               "vbs-repl"
               "vline"
               "w3m"
               "whitespace"
               "yasnippet"
               "zencoding")


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
(require 'rainbow-mode)
(require 'rainbow-delimiters)
(require 'lambda-mode)
(require 'smex)
(require 'vline)
(require 'parfait-mode)
(require 'visual-basic-mode)
(require 'vbs-repl)
(require 'htmlize)
(require 'lorem-ipsum)
(require 'gist)
(require 'deft)
(require 'perspective)
(require 'sws-mode)
(require 'color-theme-solarized)
(require 'todochiku)
;(require 'emms-setup)
;(require 'ecb)


;; --[ Autoload ]--------------------------------------------------------------
(autoload 'js2-mode       "js2-mode"       nil t)
(autoload 'js3-mode       "js3"            nil t)
(autoload 'markdown-mode  "markdown-mode"  nil t)
(autoload 'batch-mode     "batch-mode"     nil t)
(autoload 'coffee-mode    "coffee-mode"    nil t)
(autoload 'jade-mode      "jade-mode"      nil t)
(autoload 'clojure-mode   "clojure-mode"   nil t)
(autoload 'edje-mode      "edje-mode"      nil t)
(autoload 'zencoding-mode "zencoding-mode" nil t)
(autoload 'lua-mode       "lua-mode"       nil t)
(autoload 'bnf-mode       "bnf-mode"       nil t)
;(autoload 'jde-mode       "jde-mode"       nil t)

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
(add-to-list 'auto-mode-alist '("\\.js\\(on\\)?$" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.md$"          . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.clj$"         . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edc$"         . edje-mode))
(add-to-list 'auto-mode-alist '("\\.jade$"        . jade-mode))
(add-to-list 'auto-mode-alist '("\\.vbs\\|\\.lss" . vbscript-mode))
(add-to-list 'auto-mode-alist '("\\.lua$"         . lua-mode))
;(add-to-list 'auto-mode-alist '("\\.java$"        . jde-mode))

(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; --[ YaSnippet ]-------------------------------------------------------------
(setq yas/root-directory "~/.emacs.d/cfg/snippets")
(yas/load-directory yas/root-directory)


;; --[ custom stuff ]----------------------------------------------------------
(quietly-read-abbrev-file "~/.emacs.d/.abbrevs")
(load "utils/all")
(load "sorella/profile")

