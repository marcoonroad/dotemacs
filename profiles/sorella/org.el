;;; org.el --- Configuration for Org-mode

(require 'org)

;; ------------------------------------------------------------------------
;; Interface / Usability
;; ------------------------------------------------------------------------

;; Using return to follow links so there's no need to reach for the mouse.
(setq org-return-follows-link t)


;; The drawers we care about.
(setq org-drawers '("PROPERTIES" "LOGBOOK"))


;; TODO workflow and usage.
(setq org-todo-keywords
      '(; Normal tasks
        (sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(D!/!)")
        (sequence "WAITING(w@/!)" "|" "CANCELLED(C@/!)")

        ; Projects
        (sequence "PROJECT(p)" "COMPONENT(c)")

        ; Issues
        (sequence "ISSUE(i)" "ANALYSED(a!)" "|" "FIXED(f!/!)" "WONT-FIX(w!/!)")))

;; The S-<arrow> keycombo shouldn't trigger note addition
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;; Automatically sets tags according to task state
(setq org-todo-state-tags-triggers
      '(("CANCELLED" ("CANCELLED" . t))
        ("WAITING"   ("WAITING"   . t))
        ("WONT-FIX"  ("CANCELLED" . t))
        ("ISSUE"     ("WAITING") ("CANCELLED"))
        ("NEXT"      ("WAITING"))
        ("TODO"      ("WAITING") ("CANCELLED"))
        ("STARTED"   ("WAITING"))
        ("FIXED"     ("WAITING") ("CANCELLED"))))


;; ------------------------------------------------------------------------
;; Display-related configuration
;; ------------------------------------------------------------------------
(setq org-pretty-entities t)


;; ------------------------------------------------------------------------
;; Capture
;; ------------------------------------------------------------------------
;; File to store the quick notes
(setq org-default-notes-file "~/org/refile.org")

;; Templates to use when capturing
(setq org-capture-templates
      '(("t" "todo" entry (file "~/org/refile.org")
         "* TODO %?\n%U\n%a\n	%i"
         :clock-in t
         :clock-resume t)

        ("n" "note" entry (file "~/org/refile.org")
         "* %?	:NOTE:\n%U\n%a\n	%i"
         :clock-in t
         :clock-resume t)
        
        ("u" "urgent" entry (file "~/org/pomodoro-refile.org")
         "* TODO %? :URGENT:INTERRUPTION:\n%U")

        ("a" "activity" entry (file "~/org/pomodoro-refile.org")
         "* TODO %? :ACTIVITY:INTERRUPTION:\n%U")))


;; ----------------------------------------------------------------------------
;; Clocking related stuff
;; ----------------------------------------------------------------------------
;; Resume clocking when Emacs is restarted
(org-clock-persistence-insinuate)
(setq org-clock-persist '(history))

(setq org-clock-history-length              5
      org-clock-in-resume                   t
      org-clock-in-switch-to-state          "STARTED"
      org-clock-out-remove-zero-time-clocks t
      org-clock-out-when-done               t
      org-clock-auto-clock-resolution       'when-no-clock-is-running)


;; Removes empty LOGBOOK drawers at clock-out
(defun sa/remove-empty-logbook ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

(add-hook 'org-clock-out-hook 'sa/remove-empty-logbook)


;; ----------------------------------------------------------------------------
;; Agenda
;; ----------------------------------------------------------------------------
;; Files for the agenda
(setq org-agenda-files '("~/org"))

(setq org-agenda-custom-commands
      '(("N" "Notes" tags "NOTE"
         ((org-agenda-overriding-header "Notes")
          (org-tags-match-list-sublevels t)))

        (" " "Agenda"
         ((agenda "" nil)
          (tags "REFILE"
                ((org-agenda-overriding-header "Tasks to Refile")))

          (tags-todo "/!ISSUE|ANALYSED"
                     ((org-agenda-overriding-header "Pending issues")
                      (org-agenda-tags-match-list-sublevels t)
                      (org-agenda-sorting-strategy
                       '(priority-down effort-up category-keep))))

          (tags-todo "-WAITING-CANCELLED/!NEXT|STARTED"
                     ((org-agenda-overriding-header "Active tasks")
                      (org-agenda-todo-ignore-scheduled t)
                      (org-agenda-todo-ignore-deadlines t)
                      (org-tags-match-list-sublevels t)
                      (org-agenda-sorting-strategy
                       '(todo-state-down effort-up category-keep))))

          (tags-todo "WAITING-CANCELLED"
                     ((org-agenda-overriding-header "Stuck tasks")))

          (tags-todo "/!PROJECT|COMPONENT"
                     ((org-agenda-overriding-header "Projects")
                      (org-tags-match-list-sublevels 'indented)
                      (org-agenda-todo-ignore-scheduled 'future)
                      (org-agenda-todo-ignore-deadlines 'future)
                      (org-tags-match-list-sublevels t)
                      (org-agenda-sorting-strategy
                       '(category-keep))))

          (tags-todo "-CANCELLED/TODO"
                     ((org-agenda-overriding-header "Future tasks")
                      (org-agenda-match-list-sublevels t)
                      (org-agenda-sorting-strategy
                       '(todo-state-up effort-up category-keep)))))
         nil)))


;; ----------------------------------------------------------------------------
;; Columns
;; ----------------------------------------------------------------------------
;; Default column configuration
(setq org-columns-default-format "%60ITEM(Task) %20Effort(Effort){:} %20CLOCKSUM")


;; ----------------------------------------------------------------------------
;; Properties
;; ----------------------------------------------------------------------------
(setq org-global-properties
      '(("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00")))


;; ----------------------------------------------------------------------------
;; Tags
;; ----------------------------------------------------------------------------
(setq org-tag-alist '((:startgroup)
                      ("@work"        . ?w)
                      ("@home"        . ?h)
                      ("@orpheos"     . ?o)
                      ("@gow"         . ?g)
                      (:endgroup)

                      ("WAITING"      . ?W)
                      ("CANCELLED"    . ?C)
                      ("TESTS"        . ?T)
                      ("FEATURE"      . ?F)
                      ("DOCS"         . ?D)
                      ("OPTIMISATION" . ?O)
                      ("PERSONAL"     . ?P)))


;; ----------------------------------------------------------------------------
;; Babel
;; ----------------------------------------------------------------------------
(setq org-plantuml-jar-path "~/bin/plantuml/plantuml.jar")
(setq org-ditaa-jar-path    "/usr/bin/ditaa")
(setq org-confirm-babel-evaluate (lambda (lang body)
                                   (not (string= lang "ditaa"))))

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot        . t)
         (ditaa      . t)
         (R          . t)
         (python     . t)
         (ruby       . t)
         (gnuplot    . t)
         (clojure    . t)
         (sh         . t)
         (ledger     . t)
         (org        . t)
         (plantuml   . t)
         (latex      . t))))


;; ------------------------------------------------------------------------
;; Hooks
;; ------------------------------------------------------------------------

;; Updates all dynamic blocks before saving or exporting
(add-hook 'before-save-hook           'org-update-all-dblocks)
(add-hook 'org-export-preprocess-hook 'org-update-all-dblocks)

;; Display images directly in the org-buffer (for ditaa, mostly)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images
                                        'append)
