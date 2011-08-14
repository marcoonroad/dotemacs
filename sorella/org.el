;; ----------------------------------------------------------------------------
;; Org-mode configuration
;; ----------------------------------------------------------------------------
(global-set-key "\C-col" 'org-store-link)
(global-set-key "\C-coa" 'org-agenda)
(global-set-key "\C-cob" 'org-iswitchb)
(global-set-key "\C-coc" 'org-clock-goto)
(global-set-key "\C-cot" 'org-clock-in)
(global-set-key "\C-cor" 'org-capture)


(setq org-drawers '("PROPERTIES" "LOGBOOK"))


;; use return to follow links so I need no mouse
(setq org-return-follows-link t)


;; Files for the agenda
(setq org-agenda-files '("~/org"
                         "~/work/black"))


;; Standard and default keywords for org files
;;
;; Normal tasks go through the TODO→DONE workflow.
;; Issues use a ISSUE→FIXED workflow.
(setq org-todo-keywords
      '((sequence "PROJECT(p)" "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(d!/!)")
        (sequence "WAITING(w@/!)" "|" "CANCELLED(c@/!)")
        (sequence "ISSUE(i)" "ANALYSED(a!)" "|" "FIXED(f!/!)")))


;; Don't append notes when using S-arrow to change state
(setq org-treat-S-cursor-todo-selection-as-state-change nil)


;; Automatically sets tags according to task state
(setq org-todo-state-tags-triggers
      '(("CANCELLED" ("CANCELLED" . t))
        ("WAITING"   ("WAITING"   . t))
        ("ISSUE"     ("WAITING"   . t))
        ("NEXT"      ("WAITING"))
        ("TODO"      ("WAITING") ("CANCELLED"))
        ("STARTED"   ("WAITING"))
        ("FIXED"     ("WAITING") ("CANCELLED"))))


;; Capture for taking quick notes
(setq org-default-notes-file "~/org/refile.org")

(setq org-capture-templates
      '(("t" "todo" entry (file "~/org/refile.org")
         "* TODO %?\n%U\n%a\n	%i"
         :clock-in t
         :clock-resume t)

        ("n" "note" entry (file "~/org/refile.org")
         "* %?	:NOTE:\n%U\n%a\n	%i"
         :clock-in t
         :clock-resume t)))


;; ----------------------------------------------------------------------------
;; Clocking related stuff
;; ----------------------------------------------------------------------------
;; Resume clocking when Emacs is restarted
(org-clock-persistence-insinuate)
(setq org-clock-persist '(history))

(setq org-clock-history-length 5)
(setq org-clock-in-resume t)
(setq org-clock-in-switch-to-state "STARTED")
(setq org-clock-out-remove-zero-time-clocks t)
(setq org-clock-out-when-done t)
(setq org-clock-auto-clock-resolution 'when-no-clock-is-running)


;; Removes empty LOGBOOK drawers at clock-out
(defun s/remove-empty-logbook ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

(add-hook 'org-clock-out-hook 's/remove-empty-logbook)


;; ----------------------------------------------------------------------------
;; Agenda
;; ----------------------------------------------------------------------------
(setq org-agenda-custom-commands
      '(("N" "Notes" tags "NOTE"
         ((org-agenda-overriding-header "Notes")
          (org-tags-match-list-sublevels t)))

        (" " "Agenda"
         ((agenda "" nil)
          (tags "REFILE"
                ((org-agenda-overriding-header "Tasks to Refile")))

          (tags-todo "-PROJECT-CANCELLED/!"
                     ((org-agenda-overriding-header "Stuck Projects")
                      (org-tags-match-list-sublevels 'indented)))

          (tags-todo "-PROJECT-WAITING-CANCELLED/!NEXT|STARTED"
                     ((org-agenda-overriding-header "Next tasks")
                      (org-agenda-todo-ignore-scheduled t)
                      (org-agenda-todo-ignore-deadlines t)
                      (org-tags-match-list-sublevels t)
                      (org-agenda-sorting-strategy
                       '(todo-state-down effort-up category-keep))))

          (tags-todo "/!PROJECT"
                     ((org-agenda-overriding-header "Projects")
                      (org-tags-match-list-sublevels 'indented)
                      (org-agenda-todo-ignore-scheduled 'future)
                      (org-agenda-todo-ignore-deadlines 'future)
                      (org-agenda-sorting-strategy
                       '(category-keep))))

          (tags-todo "-WAITING-PROJECT"
                     ((org-agenda-overriding-header "Waiting and Postponed"))))
         nil)))


;; Columns 'n stuff
(setq org-columns-default-format "%60ITEM(Task) %20Effort(Effort){:} %20CLOCKSUM")


;; Properties
(setq org-global-properties
      '(("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00")))

(setq org-tag-alist '((:startgroup)
                      ("@work"        . ?w)
                      ("@home"        . ?h)
                      ("@orpheos"     . ?o)
                      ("@gow"         . ?g)
                      (:endgroup)

                      ("TESTS"        . ?t)
                      ("FEATURE"      . ?f)
                      ("DOCS"         . ?d)
                      ("OPTIMISATION" . ?s)
                      ("PERSONAL"     . ?p)))

      



;; ----------------------------------------------------------------------------
;; Org-mode hooks
;; ----------------------------------------------------------------------------
(add-hook 'org-mode-hook
          (lambda()
            (make-variable-buffer-local 'yas/trigger-key)
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-group)))
