;;; programming/markdown.el --- Settings for working with Markdown

(require 'markdown-mode)


;; ---------------------------------------------------------------------
;; Configuration
;; ---------------------------------------------------------------------
(setq markdown-command             "pandoc -r markdown -w html5"
      markdown-link-space-sub-char "-")

;; ---------------------------------------------------------------------
;; Auto-modes
;; ---------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))



