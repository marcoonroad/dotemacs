;;; versioning.el --- Packages that deal with VCS

;; ------------------------------------------------------------------------
;; diff-hl: Highlight uncommited changes in the buffer
;; ------------------------------------------------------------------------
(when (package-installed-p 'diff-hl)
  (require 'diff-hl)
  (global-diff-hl-mode))

