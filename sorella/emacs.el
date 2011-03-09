;; ----------------------------------------------------------------------------
;; General configuration for Emacs itself
;; ----------------------------------------------------------------------------

(menu-bar-mode    1) ;; Enables the menu
(scroll-bar-mode -1) ;; but turns off the useless scrollbar
(tool-bar-mode   -1) ;; and the useless toolbar

;; Keeping all lines below 79 characters is programmer/tty-friendly and
;; improves readability.
(setq-default fill-column 79)

;; Don't use tabs for indentation.
(setq-default indent-tabs-mode nil)

;; I like leaving my tabs at 4 spaces-long. It provides good readability and
;; doesn't waste all my horizontal space.
(setq-default tab-width 4)

;; Use <TAB> only for indenting.
(setq tab-always-indent t)

;; I like knowing where in the line I am, exactly, so column-number-mode for
;; the win.
(setq column-number-mode t)

;; Save everytime I bookmark
(setq bookmark-save-flag 1)

;; Paren match highlighting is one of the most useful things ever... at least
;; where both parens are visible in the screen. Since I go with functional
;; programming most of the time, this is really nice to have.
(show-paren-mode t)

;; Uses the default browser in my system as the default Emacs browser
(setq browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program  "/etc/alternatives/x-www-browser")

;; Don't clutter my file tree with backups, organize them instead
(setq backup-by-copying      t
      backup-directory-alist '(("." . "~/.saves"))
      delete-old-versions    t
      kept-new-versions      6
      kept-old-versions      2
      version-control        t)

;; Highlights the current line for faggy's sake
(global-hl-line-mode t) 

;; ----------------------------------------------------------------------------
;; Interactively resizes the current window
;;
;; Kinda stolen from this part of the EmacsWiki:
;; > http://www.emacswiki.org/emacs/WindowResize
;; ----------------------------------------------------------------------------
(defun window-resize ()
  "interactively resizes the window"  
  (interactive)
  (while (progn
           (let ((key (read-event "Use the arrow keys to resize")))
             (cond
              ;; resize vertically
              ((eq key 'up)    (enlarge-window  1) t)
              ((eq key 'down)  (enlarge-window -1) t)
              ;; resize horizontally
              ((eq key 'left)  (enlarge-window-horizontally -1) t)
              ((eq key 'right) (enlarge-window-horizontally  1) t)
              ;; breaks from the loop otherwise
              (t nil))))))


;; ----------------------------------------------------------------------------
;; Keyboard shortcuts
;; ----------------------------------------------------------------------------

;; Allows copying to the system clipboard
(global-set-key (kbd "<S-delete>") 'clipboard-kill-region)
(global-set-key (kbd "<C-insert>") 'clipboard-kill-ring-save)
(global-set-key (kbd "<S-insert>") 'clipboard-yank)

;; Saner keys for working with bookmarks
(global-set-key (kbd "<f9>")  'bookmark-jump)
(global-set-key (kbd "<f10>") 'bookmark-set)

;; Abbreviations
(global-set-key (kbd "C-/") 'expand-abbrev)

;; Some minor and very useful modes
(global-set-key "\C-cmf" 'auto-fill-mode)

;; Tab to tab stop
(global-set-key (kbd "C-\\") 'tab-to-tab-stop)

;; Mnemonic-based input
(global-set-key "\C-ci" 'toggle-input-method)

;; Starts Anything
(global-set-key "\C-ca" 'anything)

;; Resizes the window
(global-set-key "\C-xw" 'window-resize)

