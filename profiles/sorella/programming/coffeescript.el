;;; programming/coffeescript.el --- Settings for CS and forks

(require 'coffee-mode)


(add-to-list 'auto-mode-alist '("\\.coffee$"  . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile$"   . coffee-mode))

(when (boundp 'sa/turn-on-electric-case)
  (add-hook 'coffee-mode-hook 'sa/turn-on-electric-case))
