;;; irc.el --- IRC configuration stuff
(require 'erc)
(setq erc-user-full-name "Quildreen Motta")
(setq erc-email-userid "quildreen")

;; Logging
(setq erc-log-insert-log-on-open nil)
(setq erc-log-channels t)
(setq erc-log-channels-directory "~/.irclogs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-timestamps nil)

;; Truncating
(setq erc-max-buffer-size 20000)
(defvar erc-insert-post-hook)
(add-hook 'erc-insert-post-hook 'erc-truncate-buffer)
(setq erc-truncate-buffer-on-save t)

;; Highlighting
(require 'erc-match)
(setq erc-keywords '("sorella" "kill" "killdream" "quil" "quildreen"))
(erc-match-mode)

;; Auto-join and channels
(require 'erc-join)
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
      '(("freenode.net"
         "#emacs"
         "##javascript"
         "#livescript"
         "#functionaljavascript"
         "#inimino"
         "#haskell"
         "#clojure"
         "#scala"
         "#scalaz"
         "#altjs")
        ("irchighway.net"
         "#NaNoBrazil")
        ("mozilla.org"
         "#rust"
         "#js")
        ("rizon.net"
         "#gow")))

;; Connecting
(defun sa/irc ()
  "Connect to IRC."
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick "sorella")
  (erc :server "irc.rizon.net" :port 6667 :nick "sorella")
  (erc :server "irc.mozilla.org" :port 6667 :nick "sorella")
  (erc :server "irc.irchighway.net" :port 6667 :nick "sorella"))
