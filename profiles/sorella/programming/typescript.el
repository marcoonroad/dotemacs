;;; programming/typescript.el --- Definitions for working with TS

(require 'typescript)
(require 'tss)

(add-to-list 'auto-mode-alist '("\\.ts$" . typescript-mode))

(setq tss-popup-help-key          "C-:"
      tss-jump-to-definition-key  "C->"
      typescript-auto-indent-flag nil
      typescript-indent-level     2)

(tss-config-default)
