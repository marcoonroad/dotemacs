
;; ---------------------------------------------------------------------
;; ERC related stuff
;; ---------------------------------------------------------------------

(erc-services-mode t)
(erc-spelling-mode t)
(erc-autojoin-mode t)

(setq erc-public-away-p nil)
(setq erc-prompt "\n>›")
(setq erc-interpret-controls-p 'remove)
(setq erc-interpret-mirc-color nil)
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(setq erc-autojoin-channels-alist
      '(("freenode.net" "##javascript"
                        "#silexars"
                        "#node.js"
                        "#oftn"
                        "#renpy"
                        "#emacs"
                        )))
