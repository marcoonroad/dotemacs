;;; irc.el --- IRC configuration stuff
(require 'circe)

;; Keeping visual sanity
(setq circe-reduce-lurker-spam t)
(setq circe-format-server-topic "*** Topic change by {origin}: {topic-diff}")

;; Precedes the prompt with the channel name
(add-hook 'circe-chat-mode-hook 'sa/circe-prompt)
(defun sa/circe-prompt ()
  (lui-set-prompt
   (concat (propertize (concat (buffer-name) ">")
                       'face 'circe-prompt-face)
           " ")))

;; Adds CHANOP commands
(eval-after-load 'circe '(require 'circe-chanop))

;; Logging
(require 'lui-logging)
(add-hook 'circe-channel-mode-hook 'enable-lui-logging)

;; Highlights
(setq lui-highlight-keywords
      '("\\bquil" 
        "\\bsorella\\b"
        "\\brobotlolita\\b"
        "\\bgay"
        "\\blesbian"
        ))


;; Network definitions
(load "~/.irc")
(setq circe-network-options
      `(("Freenode"
         :host "irc.freenode.net"
         :nick "Sorella"
         :channels ("#emacs"
                    "#esoteric"
                    "##javascript"
                    "#livescript"
                    "#functionaljavascript"
                    "#inimino"
                    "#idris"
                    "#haskell"
                    "#higgsjs"
                    "#clojure"
                    "#scala"
                    "#scalaz"
                    "#altjs"
                    "#Node.js"
                    "#elementary"
                    "#python-br"
                    "#bbg"
                    "##hott"
                    "#altjs"
                    "#lua"
                    "#oftn")
         :nickserv-password ,sa/freenode-pwd)
        ("Rizon"
         :host "irc.rizon.net"
         :nick "Sorella"
         :channels ("#gow")
         :nickserv-password ,sa/rizon-pwd)
        ))

;; Utility commands
(defun sa/irc ()
  "Connect to IRC"
  (interactive)
  (circe "Freenode")
  (circe "Rizon"))
