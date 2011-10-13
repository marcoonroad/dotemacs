;; ----------------------------------------------------------------------------
;; C Configuration stuff
;; ----------------------------------------------------------------------------
(setq c-default-style "k&r")
(setq c-basic-offset  tab-width) ;; honour the tab width

(add-hook 'c-mode-hook '(lambda()
                          (c-toggle-electric-state -1)))
