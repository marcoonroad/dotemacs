;;; programming/puppet.el --- Settings for Puppet

(require 'puppet-mode)

(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
