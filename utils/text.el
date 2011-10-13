;; Utilities for text editing

(defun sorella/dotted-tabs ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward " \\( +\\) " nil t)
      (replace-match (concat " "
                             (make-string (length (match-string 1)) ?.)
                             " ")))))