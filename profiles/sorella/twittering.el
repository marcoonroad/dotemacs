;;; twittering.el --- Configuration for twittering-mode

(require 'twittering-mode)

;; ------------------------------------------------------------------------
;; Interface / Usability
;; ------------------------------------------------------------------------

;; Display user icons
(setq twittering-icon-mode t)

;; Uses a master password and encrypted file for storing auth-tokens rather
;; than having to auth the app on Twitter everytime.
(setq twittering-use-master-password t)

;; How fast updates need to be fetched
(setq twittering-timer-interval 300)

;; Don't show useless information in the minibuffer
(setq twittering-url-show-status nil)

;; Timelines that should be fetched from the start
(setq twittering-initial-timeline-spec-string
      '(":replies"
        ":direct_messages"
        ":search/javascript/"
        ":search/es5/"
        ":home"))

