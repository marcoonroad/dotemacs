;;; keybindings.el --- Custom keybindings for Emacs

;; ------------------------------------------------------------------------
;; Emacs core
;; ------------------------------------------------------------------------

;; Expansions
(global-set-key (kbd "C-/")  'expand-abbrev)
(global-set-key (kbd "<f9>") 'sa/eval-and-replace)

;; Tab-to-tab stop
(global-set-key (kbd "C-\\") 'tab-to-tab-stop)

;; Mnemonic-based input
(global-set-key "\C-ci" 'toggle-input-method)

;; Alignment
(global-set-key "\C-cjr" 'align-regexp)
(global-set-key "\C-cjt" 'sa/align-current-at-right)

;; Scrolling
(global-set-key (kbd "C-<") (lambda ()
                              (interactive)
                              (scroll-up 1)))
(global-set-key (kbd "C->") (lambda ()
                              (interactive)
                              (scroll-down 1)))

;; Resising
(global-set-key "\C-xw" 'sa/window-resise)

;; Smex
(global-set-key "\M-x"         'smex)
(global-set-key "\M-X"         'smex-major-mode-commands)
(global-set-key "\C-c\C-c\M-x" 'execute-extended-command)

;; Anything
(global-set-key "\C-ca" 'anything)

;; ------------------------------------------------------------------------
;; Server / Emacsclient
;; ------------------------------------------------------------------------
(add-hook 'server-switch-hook
          (lambda ()
            (when (current-local-map)
              (use-local-map (copy-keymap (current-local-map))))
            (when server-buffer-clients
              (local-set-key "\C-xk" 'server-edit))))


;; ------------------------------------------------------------------------
;; Mode activation
;; ------------------------------------------------------------------------
(global-set-key "\C-cmf" 'auto-fill-mode)
(global-set-key "\C-cmr" 'rainbow-mode)
(global-set-key "\C-cmp" 'parfait-mode)
(global-set-key "\C-cmz" 'zen-coding-mode)
(global-set-key "\C-cmw" 'whitespace-mode)


;; ------------------------------------------------------------------------
;; Interface
;; ------------------------------------------------------------------------
(global-set-key (kbd "<f12> d") 'color-theme-candy-chain)
(global-set-key (kbd "<f12> l") 'color-theme-solarized-light)

(global-set-key "\C-xp" 'persp-switch)
                

;; ------------------------------------------------------------------------
;; mode: JavaScript
;; ------------------------------------------------------------------------
(add-hook 'js3-mode-hook
          (lambda()
            (local-set-key "\C-cjh" 'js3-mark-defun)
            (local-set-key "\C-cje" 'js3-next-error)
            (local-set-key "\C-cjf" 'js3-mode-toggle-hide-functions)
            (local-set-key "\C-cjc" 'js3-mode-toggle-//-comment)
            (local-set-key "\C-cjt" 'js3-mode-toggle-element)
            (local-set-key (kbd "<backtab>") 'js3-indent-bounce-backwards)))


;; ------------------------------------------------------------------------
;; mode: Org
;; ------------------------------------------------------------------------
(add-hook 'org-mode-hook
          (lambda()
            (local-set-key "\C-cy" 'yas/expand)))


;; ------------------------------------------------------------------------
;; mode: Twittering
;; ------------------------------------------------------------------------
(add-hook 'twittering-mode-hook
          (lambda ()
            (local-set-key "F"     'twittering-friends-timeline)
            (local-set-key "R"     'twittering-replies-timeline)
            (local-set-key "U"     'twittering-user-timeline)
            (local-set-key "\C-cr" 'twittering-retweet)))

(global-set-key "\C-ct" 'twittering-update-status-interactive)


;; ------------------------------------------------------------------------
;; mode: Bookmarks+
;; ------------------------------------------------------------------------
(global-set-key "\C-xm" 'bookmark-map) ;; C-x m is mail, but fuck that
(global-set-key "\C-xmc" 'bmkp-set-map)


;; ------------------------------------------------------------------------
;; mode: electric-case
;; ------------------------------------------------------------------------
(global-set-key "\C-ce" 'electric-case-mode)
