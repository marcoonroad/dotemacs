;; Based on Emacs Prelude's prelude-package.el
(when (string-match-p "^23" emacs-version)
  (add-to-list 'load-path "~/.emacs.d/vendor/package"))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


(defun sa/packages-install (package-list)
  "Installs and updates all of the packages listed."
  (message "Refreshing the packages...")
  (package-refresh-contents)
  (dolist (package package-list)
    (when (not (package-installed-p package))
      (package-install package)))
  (message "Packages updated successfully."))


(defmacro sa/use-packages (&rest package-list)
  `(sa/packages-install '(,@package-list)))


(defun sa/vendor-add (&rest modules)
  (dolist (module modules)
    (add-to-list 'load-path (concat "~/.emacs.d/vendor/" module))))


;; Load the right profile
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/profiles")
(load "sorella/profile")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Droid Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))
