;; ----------------------------------------------------------------------------
;; Utility functions
;; ----------------------------------------------------------------------------
(defun twittering-notify-new-tweets ()
  "Notify of new tweets through libnotify

Requires the notify-send binary to be installed."
  (let ((n twittering-new-tweets-count))
    (start-process "twittering-notify" nil "notify-send"
                   "-i" twittering-emacs-icon
                   (format "twmode — %s" twittering-new-tweets-spec)
                   (format "You have %d new tweet%s"
                           (n (if (> n 1) "s" ""))))))


;; ----------------------------------------------------------------------------
;; Configurations for Twittering-mode
;; ----------------------------------------------------------------------------
;; Display user icons
(setq twittering-icon-mode t)

;; Uses a master password and encrypted file for storing auth-tokens rather
;; than having to auth the app on Twitter everytime.
(setq twittering-use-master-password t)

;; How fast updates need to be fetched
(setq twittering-timer-interval 300)

;; Don't show useless information in the minibuffer
(setq twittering-url-show-status nil)

;; Icon to use when notifying of new tweets through libnotify
(setq twittering-emacs-icon "/usr/share/icons/Faenza/apps/scalable/emacs.svg")

;; Timelines that should be fetched from the start
(setq twittering-initial-timeline-spec-string
      '(":replies"
        ":direct_messages"
        ":search/javascript/"
        ":search/es5/"
        ":home"))


;; ----------------------------------------------------------------------------*
;; Shortcut keys
;; ----------------------------------------------------------------------------
(add-hook 'twittering-mode-hook
          (lambda ()
            (local-set-key "F"     'twittering-friends-timeline)
            (local-set-key "R"     'twittering-replies-timeline)
            (local-set-key "U"     'twittering-user-timeline)
            (local-set-key "\C-cr" 'twittering-retweet)))