;;; programming/livescript.el --- Settings for LiveScript

(require 'livescript-mode)

(add-to-list 'auto-mode-alist '("\\.ls$"      . coffee-mode))
(add-to-list 'auto-mode-alist '("Slakefile$"  . coffee-mode))
