;;; irc.el --- IRC configuration stuff
(require 'erc)
(setq erc-user-full-name "Quildreen Motta")
(setq erc-email-userid "quildreen")

;; Minimal distractions
(setq sa/erc-minor-channels '("#gow" "#NaNoBrazil" "#inimino"))
(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT"))
(setq erc-current-nick-highlight-type 'nick)
(setq erc-track-use-faces t)
(setq erc-track-faces-priority-list
      '(erc-current-nick-face erc-keyword-face))
(setq erc-track-priority-faces-only 'all)
(add-hook 'erc-join-hook 'sa/set-hide-list)

(defun sa/set-hide-list ()
  (when (member (buffer-name) sa/erc-minor-channels)
    (make-variable-buffer-local 'erc-hide-list)
    (setq erc-hide-list '())))

;; Logging
(setq erc-log-insert-log-on-open nil)
(setq erc-log-channels t)
(setq erc-log-channels-directory "~/.irclogs/")
(setq erc-save-buffer-on-part t)
(setq erc-log-write-after-send t)
(setq erc-log-write-after-insert t)
(setq erc-hide-timestamps nil)

;; Truncating
(setq erc-max-buffer-size 20000)
(defvar erc-insert-post-hook)
(add-hook 'erc-insert-post-hook 'erc-truncate-buffer)
(setq erc-truncate-buffer-on-save t)

;; Highlighting
(require 'erc-match)
(setq erc-keywords '("\\bkill\\b"
                     "\\bkilldream\\b"
                     "\\bquil\\b"
                     "\\bquildreen\\b"))
(erc-match-mode)

;; Auto-join and channels
(require 'erc-join)
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
      '(("freenode.net"
         "#emacs"
         "#esoteric"
         "##javascript"
         "#livescript"
         "#functionaljavascript"
         "#inimino"
         "#haskell"
         "#clojure"
         "#scala"
         "#scalaz"
         "#altjs"
         "#Node.js"
         "#elementary"
         "##leveldb"
         "#python-br")
        ("irchighway.net"
         "#NaNoBrazil")
        ("mozilla.org"
         "#rust"
         "#js")
        ("rizon.net"
         "#GOW")))


;; Connecting
(defun sa/irc ()
  "Connect to IRC."
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick "Sorella")
  (erc :server "irc.rizon.net" :port 6667 :nick "Sorella")
  (erc :server "irc.mozilla.org" :port 6667 :nick "Sorella")
  (erc :server "irc.irchighway.net" :port 6667 :nick "Sorella"))

;; Nickserv
(load "~/.ercpass")
(require 'erc-services)
(erc-services-mode 1)

(setq erc-prompt-for-nickserv-password nil)
(setq erc-nickserv-passwords
  `((freenode   (("Sorella" . ,sa/erc-freenode-password)))
    (rizon      (("Sorella" . ,sa/erc-rizon-password)))
    (irchighway (("Sorella" . ,sa/erc-irchighway-password)))))

;; Notify-send
(require 'notifications)

(defun sa/erc-notify (match-type user message)
  (unless (posix-string-match "^\\*+" message)
    (let ((name (car (split-string user "!"))))
      (notifications-notify
       :title     (concat "Erc - " name ":")
       :body      message
       :app-icon  "/usr/share/notify-osd/icons/elementary/scalable/status/notification-message-im.svg"
       :urgency   'low))))

(add-hook 'erc-text-matched-hook 'sa/erc-notify)


;; Cycle through buffers (from Emacs Wiki)
(defvar sa/erc-channels-to-visit nil
  "Channels that have not yet been visited by erc-next-channel-buffer")

(defun sa/erc-next-channel-buffer ()
  "Switch to the next unvisited channel. See erc-channels-to-visit"
  (interactive)
  (when (null sa/erc-channels-to-visit)
    (setq sa/erc-channels-to-visit 
          (remove (current-buffer) (erc-channel-list nil))))
  (let ((target (pop sa/erc-channels-to-visit)))
    (if target 
        (switch-to-buffer target))))
