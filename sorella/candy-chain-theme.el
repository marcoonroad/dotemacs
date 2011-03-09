(eval-when-compile (require 'color-theme))

;; ----------------------------------------------------------------------------
;; Candy Chain colour theme is supposed to be colourful, yet subtle. As in, it
;; should highlight what really matters to you, and makes distinguishing those
;; elements fairly easy, and tone down warnings and the like.
;; ----------------------------------------------------------------------------
(defun color-theme-candy-chain ()
  "Candy Chain is a pretty colourful theme, on charcoal black bg~"
  (interactive)
  (color-theme-install
   '(color-theme-candy-chain
     ((background-color . "#22252a")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "#ABB4A1")
      (foreground-color . "#eeeeee")
      (mouse-color . "#000000"))


     ;; Basic stuff
     (default ((t (:background "#22252a" :foreground "#eeeeee"))))
     (font-lock-builtin-face ((t (:foreground "#FA2573"))))
     (font-lock-comment-delimiter-face ((t (:foreground "#75766A"))))
     (font-lock-comment-face ((t (:foreground "#75766A"))))
     (font-lock-constant-face ((t (:foreground "#FA2573"))))
     (font-lock-doc-face ((t (:foreground "#ACAE95"))))
     (font-lock-function-name-face ((t (:foreground "#67D9F0"))))
     (font-lock-keyword-face ((t (:foreground "#C48DFF"))))
     (font-lock-negation-char-face ((t (nil))))
     (font-lock-preprocessor-face ((t (:foreground "#75766A"))))
     (font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
     (font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))
     (font-lock-string-face ((t (:foreground "#A6E32D"))))
     (font-lock-type-face ((t (:foreground "#FC951E"))))
     (font-lock-variable-name-face ((t (:foreground "#729FCF"))))
     (font-lock-warning-face ((t (:bold t :foreground "#E52222" :weight bold))))
     (fringe ((t (:background "#555753"))))
     (show-paren-match ((t (:background "#67D9F0" :foreground "#555753"))))
     (show-paren-mismatch ((t (:background "#FA2573"))))
     (minibuffer-prompt ((t (:foreground "#FC951E"))))
     (highlight ((t (:background "#303636"))))
     (region ((t (:background "#586045"))))
     (trailing-whitespace ((t (:bold t :background "#382323"
                                       :foreground "#624935" :weight bold))))


     ;; ISearch
     (isearch ((t (:background "#586045" :box "#ACAE95"))))
     (isearch-fail ((t (:background "#382323" :foreground "#E52222"))))



     ;; Twittering mode
     (twittering-uri-face ((t (:foreground "#729FCF"))))
     (twittering-username-face ((t (:foreground "#FC951E" :bold t))))


     ;; Usual UI stuffs
     (widget-field ((t (:background "#555753"))))
     (custom-group-tag-face ((t (:bold t      :foreground "#67D9F0"
                                 :weight bold :height 1.2))))
     (custom-variable-tag-face ((t (:bold t :foreground "#729FCF"
                                    :weight bold))))
     (custom-state-face ((t (:foreground "#A6E32Dr"))))
     (link ((t (:foreground "#729FCF" :underline nil))))


     ;; JS2 stuff
     (js2-function-param-face ((t (:foreground "#729FCF"))))


     ;; Diff
     (diff-added ((t (:foreground "#A6E32D"))))
     (diff-changed ((t (:foreground "#67D9F0"))))
     (diff-removed ((t (:foreground "#FA2573"))))
     (diff-header ((t (:background "#555753"))))
     (diff-file-header ((t (:bold t :background "#555753" :weight bold))))
     (diff-context ((t (:foreground "#EEEEEE"))))


      ;; Whitespace mode
     (whitespace-indentation ((t (:background "#555753"
                                  :foreground "#82996A"))))
     (whitespace-line ((t (:background "#5C5861" :foreground "#7A6D89"))))
     (whitespace-newline ((t (:foreground "#303636" :weight normal))))
     (whitespace-space ((t (:background "#303636" :foreground "#586045"))))
     (whitespace-tab ((t (:background "#303636" :foreground "#82996A"))))
     (whitespace-space-after-tab ((t (:background "#303636"
                                      :foreground "#82996A"))))
     (whitespace-space-before-tab ((t (:background "#382323"
                                       :foreground "#82996A"))))
     (whitespace-trailing ((t (:inherit 'trailing-whitespace))))
     (whitespace-empty ((t (:background "#382323" :foreground "#624935"))))
     (whitespace-hspace ((t (:background "#382323" :foreground "#82996A"))))


     ;; Flyspell stuff
     (flyspell-duplicate ((t (:background "#382323" :box "#FC951E"))))
     (flyspell-incorrect ((t (:background "#382323" :box "#E52222"))))


     ;; Yasnippet
     (yas/field-highlight-face ((t (:background "#586045" :box "#ACAE95"))))
)))

(add-to-list 'color-themes '(color-theme-candy-chain 
                             "Candy Chain"
                             "Quildreen Motta"))

;; Silly stuff to allow me testing the changes I do without too much hassle
(defun candy-chain-reload-theme ()
  (interactive)
  (eval-buffer)
  (color-theme-candy-chain))

(global-set-key "\C-ct" 'candy-chain-reload-theme)