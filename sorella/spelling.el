;; ----------------------------------------------------------------------------
;; Spelling related stuff
;; ----------------------------------------------------------------------------
;; Fixes flyspell mode on Ubuntu
(setq flyspell-issue-welcome-flag nil)

;; Uses british english as the default dictionary
(setq ispell-dictionary "british")


;; ----------------------------------------------------------------------------
;; Utility functions
;; ----------------------------------------------------------------------------
(defun flyspell-enable-for-modes (&rest modes)
  (dolist (mode modes)
	(add-hook mode (lambda() (flyspell-mode 1)))))


;; ----------------------------------------------------------------------------
;; Modes where spelling is really important
;; ----------------------------------------------------------------------------
(flyspell-enable-for-modes 'log-edit-mode-hook     ;; Editing commit messages

						   'markdown-mode-hook     ;; \
						   'fundamental-mode-hook  ;;  \  Plain text
						   'text-mode-hook         ;;  /    modes
						   'rst-mode-hook)         ;; /


;; ----------------------------------------------------------------------------
;; Shortcut keys
;; ----------------------------------------------------------------------------
(global-set-key "\C-cms" 'flyspell-mode)