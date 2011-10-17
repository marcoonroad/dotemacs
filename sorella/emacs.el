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
(defun sa/window-resize ()
  "interactively resizes the window"  
  (interactive)
  (while (progn
           (let ((key (read-event "Use the arrow keys to resize")))
             (cond
              ;; resize vertically
              ((eq key 'up)    (enlarge-window  1) t)
              ((eq key 'down)  (enlarge-window -1) t)
              ;; resize horizontally
              ((eq key 'left)  (enlarge-window -1 t) t)
              ((eq key 'right) (enlarge-window  1 t) t)
              ;; breaks from the loop otherwise
              (t nil))))))

;; Inserts current date
(defun sa/current-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

;; Recompiles an emacs lisp file whenever we save (if a compiled version
;; already exists, that is)
(defun sa/auto-byte-recompile ()
"If the current buffer is in emacs-lisp-mode and there already exists an `.elc'
file corresponding to the current buffer file, then recompile the file."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

(add-hook 'after-save-hook 'sa/auto-byte-recompile)


;; ----------------------------------------------------------------------------
;; Keyboard shortcuts
;; ----------------------------------------------------------------------------

(global-set-key "\C-cl" 'font-lock-fontify-buffer)

;; Allows copying to the system clipboard
(global-set-key (kbd "<S-delete>") 'clipboard-kill-region)
(global-set-key (kbd "<C-insert>") 'clipboard-kill-ring-save)
(global-set-key (kbd "<S-insert>") 'clipboard-yank)

;; Saner keys for working with bookmarks
(global-set-key (kbd "<f5>")  'bookmark-jump)
(global-set-key (kbd "<f6>") 'bookmark-set)

;; Expansions
(global-set-key (kbd "C-/") 'expand-abbrev)
(global-set-key (kbd "<f9>") 'sa/eval-and-replace)

;; Some minor and very useful modes
(global-set-key "\C-cmf" 'auto-fill-mode)
(global-set-key "\C-cmr" 'rainbow-mode)
(global-set-key "\C-cmp" 'parfait-mode)
(global-set-key "\C-cmz" 'zencoding-mode)

;; Tab to tab stop
(global-set-key (kbd "C-\\") 'tab-to-tab-stop)

;; Mnemonic-based input
(global-set-key "\C-ci" 'toggle-input-method)

;; Starts Anything
(global-set-key "\C-ca" 'anything)

;; Resizes the window
(global-set-key "\C-xw" 'sa/window-resize)

;; Align regexp
(global-set-key "\C-cjr" 'align-regexp)
(global-set-key "\C-cjt" 'sa/align-current-at-right)

;; Moving between windows
(global-set-key (kbd "<C-M-left>")  'windmove-left)
(global-set-key (kbd "<C-M-right>") 'windmove-right)
(global-set-key (kbd "<C-M-up>")    'windmove-up)
(global-set-key (kbd "<C-M-down>")  'windmove-down)

;; Scrolling
(global-set-key (kbd "C-<") (lambda() (interactive) (scroll-up   1)))
(global-set-key (kbd "C->") (lambda() (interactive) (scroll-down 1)))

;; Sane stuff for finishing edition on a server stuff
(add-hook 'server-switch-hook
            (lambda ()
              (when (current-local-map)
                (use-local-map (copy-keymap (current-local-map))))
          (when server-buffer-clients
        (local-set-key "\C-xk" 'server-edit))))
