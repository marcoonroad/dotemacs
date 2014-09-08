;;; emacs.el --- General configuration for Emacs itself.

;; ------------------------------------------------------------------------
;; Interface
;; ------------------------------------------------------------------------

;; Disables the menu, and the useless scrollbar and toolbar.
(menu-bar-mode        -1)
(scroll-bar-mode      -1)
(tool-bar-mode        -1)

;; Highlight both the current line and matching parenthesis.
(global-hl-line-mode   1)
(show-paren-mode       1)

;; Enables syntax highlighting for everything.
(global-font-lock-mode 1)

;; Shows the (Line, Column) information in the mode-line.
(line-number-mode   1)
(column-number-mode 1)

;; Inhibit the startup screen, and initial (useless) messages
(setq inhibit-startup-screen  t
      initial-scratch-message nil)

;; Scrolling when the point moves off the buffer's visible area
(setq scroll-setp           1
      scroll-conservatively 1000)

;; Makes the fringe smaller (default size in pixels is 8)
(fringe-mode 6)

;; Allow answerying y/n for all questions
(fset 'yes-or-no-p 'y-or-n-p)


;; ---------------------------------------------------------------------
;; Selective features
;; ---------------------------------------------------------------------
(put 'downcase-region 'disabled nil)


;; ------------------------------------------------------------------------
;; Editing
;; ------------------------------------------------------------------------
(prefer-coding-system 'utf-8)

;; Tab and indentation settings
(setq-default fill-column       79
              tab-width         2
              indent-tabs-mode  nil
              tab-always-indent t)

;; Deletes the selection with a single key-stroke (C-d)
(delete-selection-mode t)

;; Read abbreviation file
(quietly-read-abbrev-file "~/.emacs.d/.abbrevs")

;; Clipboard, killing and yanking, etc
(setq x-select-enable-clipboard t)

;; Show whitespace characters
(require 'whitespace)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Snippets
(when (package-installed-p 'yasnippet)
  (require 'yasnippet)
  (setq yas/root-directory "~/.emacs.d/snippets")
  (yas/load-directory yas/root-directory)
  (yas/global-mode t))


;; ------------------------------------------------------------------------
;; Buffers and navigation
;; ------------------------------------------------------------------------

;; Allow using S-<arrow> for navigating between windows
(require 'windmove)
(windmove-default-keybindings)

;; Give meaningful names for buffers with the same name. Keep the naming
;; actual by renaming after buffers are killed, but don't mess with
;; special buffers (e.g.: *<buffer>*)
(require 'uniquify)
(setq uniquify-buffer-name-style   'forward
      uniquify-separator           "/"
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re   "^\\*")

;; Remembers the location in the file when saving, for all buffers.
(setq-default save-place t)
(setq         save-place-file "~/.emacs.d/.cache/locations")
(require 'saveplace)

;; Remember the mini-buffer commands between emacs sessions
(setq savehist-additional-variables '(search ring regexp-search-ring)
      savehist-autosave-interval    60 ; seconds
      savehist-file                 "~/.emacs.d/.cache/history")
(savehist-mode t)

;; Remembers recent files
(setq recentf-save-file       "~/.emacs.d/.cache/recent-files"
      recentf-max-saved-items 200
      recentf-max-menu-items  15)
(recentf-mode t)

;; Make navigation in the minibuffer easier
(ido-mode t)
(setq ido-enable-prefix         nil
      ido-enable-flex-matching  t
      ido-create-new-buffer     'always
      ido-use-filename-at-point 'guess
      ido-max-prospects         10
      ido-default-file-method   'selected-window)

;; Ido-like selection for commands in the minibuffer
(when (package-installed-p 'smex)
  (require 'smex)
  (smex-initialize))

;; Quick-silver-like stuff for everything-Emacs
(when (package-installed-p 'anything)
  (require 'anything)
  (require 'anything-config))


;; Fast navigation/editing in a buffer
(when (package-installed-p 'fastnav)
  (require 'fastnav))


;; ------------------------------------------------------------------------
;; Spelling
;; ------------------------------------------------------------------------
(setq ispell-program-name "aspell"
      ispell-extra-args   '("--sug-mode=ultra")
      ispell-dictionary   "en_GB")

;; Fixes flyspell-mode on Ubuntu
(setq flyspell-issue-welcome-flag nil)

(add-hook 'message-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook    'turn-on-flyspell)


;; ------------------------------------------------------------------------
;; Casing and readability helpers
;; ------------------------------------------------------------------------
(when (package-installed-p 'electric-case)
  (require 'electric-case)

  (defun sa/turn-on-electric-case ()
    (electric-case-mode 1)))

;; ------------------------------------------------------------------------
;; Backups
;; ------------------------------------------------------------------------

;; Don't clutter the file tree with backups, organise them in the saves
;; directory instead.
(setq backup-by-copying      t
      backup-directory-alist '(("." . "~/.emacs.d/.cache/saves"))
      delete-old-versions    t
      kept-new-versions      6
      kept-old-versions      2
      version-control        t)


;; ------------------------------------------------------------------------
;; Workspaces
;; ------------------------------------------------------------------------
(when (package-installed-p 'perspective)
  (require 'perspective)
  (persp-mode))

(when (require 'desktop nil 'no-error)
  (desktop-save-mode 1))


;; ------------------------------------------------------------------------
;; Projects
;; ------------------------------------------------------------------------
(when (require 'projectile nil 'no-error)
  (projectile-global-mode))


;; ------------------------------------------------------------------------
;; Theming
;; ------------------------------------------------------------------------
(when (require 'color-theme nil 'no-error)
  (require 'color-theme-candy-chain)
  (require 'color-theme-solarized)
  (color-theme-solarized-light))


;; ------------------------------------------------------------------------
;; Server
;; ------------------------------------------------------------------------
(server-start)
