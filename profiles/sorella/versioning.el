;;; versioning.el --- Packages that deal with VCS

;; ------------------------------------------------------------------------
;; ahg: Deals with Mercurial repositories betterer
;; ------------------------------------------------------------------------
(require 'ahg)

;; ------------------------------------------------------------------------
;; diff-hl: Highlight uncommited changes in the buffer
;; ------------------------------------------------------------------------
(when (package-installed-p 'diff-hl)
  (require 'diff-hl)
  (global-diff-hl-mode)
  

  (when (featurep 'ahg)
    (defadvice ahg-status-maybe-refresh (after ahg-update-diff-hl activate)
      (diff-hl-update))))
