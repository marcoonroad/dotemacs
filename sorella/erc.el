;; ---------------------------------------------------------------------
;; ERC related stuff
;; ---------------------------------------------------------------------

(erc-services-mode t)
(erc-spelling-mode t)
(erc-autojoin-mode t)

(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-public-away-p nil)
(setq erc-prompt "\n>›")

(setq erc-autojoin-channels-alist
      '(("freenode.net" "#e"
                        "##javascript"
                        "#coffeescript"
                        "#prototype"
                        "#silexars"
                        "#python-br"
                        "#ubuntu-br"
                        )))
