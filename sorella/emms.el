;; ---------------------------------------------------------------------
;; Emms configuration
;; ---------------------------------------------------------------------

(emms-devel)
(emms-default-players)

(setq emms-source-file-default-directory "~/Music/")
(setq emms-info-asynchronously t)


(add-hook 'emms-player-started-hook 'emms-show)
(setq emms-show-format "NP: %s")