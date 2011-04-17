;; ----------------------------------------------------------------------------
;; Org-mode configuration
;; ----------------------------------------------------------------------------
(global-set-key "\C-col" 'org-store-link)
(global-set-key "\C-coa" 'org-agenda)
(global-set-key "\C-cob" 'org-iswitchb)

(setq org-return-follows-link t)

(setq org-agenda-files '("~/Dropbox/org/main.org"))