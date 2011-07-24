(add-hook 'markdown-mode-hook
          (lambda()
            (local-set-key (kbd "<tab>") 'yas/expand)))
