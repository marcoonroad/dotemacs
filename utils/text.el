;; Utilities for text editing

(defun sorella/dotted-tabs ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward " \\( +\\) " nil t)
      (replace-match (concat " "
                             (make-string (length (match-string 1)) ?.)
                             " ")))))



(defun align-region-at-right ()
  "Aligns the first column of each line at right.

The function treats every line in the region as a two-column line, splitting
at the first whitespace after an identifier."
  (interactive)
  (align-regexp (region-beginning) (region-end)
                "^[[:blank:]]*\\([[:alnum:]]+\\)[[:blank:]]*\\(\\s-.+\\)" -1 0 t))

(defun align-current-at-right ()
  (interactive)
  (save-excursion
    (mark-paragraph)
    (align-region-at-right)))