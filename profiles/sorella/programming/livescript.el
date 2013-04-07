;;; programming/livescript.el --- Settings for LiveScript

(require 'livescript-mode)

(add-to-list 'auto-mode-alist '("\\.ls$"      . livescript-mode))
(add-to-list 'auto-mode-alist '("Slakefile$"  . livescript-mode))
