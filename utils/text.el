;; Utilities for text editing

(defun sorella/dotted-tabs ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward " \\( +\\) " nil t)
      (replace-match (concat " "
                             (make-string (length (match-string 1)) ?.)
                             " ")))))



(defun sa/align-region-at-right ()
  "Aligns the first column of each line at right.

The function treats every line in the region as a two-column line, splitting
at the first whitespace after an identifier."
  (interactive)
  (align-regexp (region-beginning) (region-end)
                "^[[:blank:]]*\\([[:alnum:],<>/=&!\\-\\?\\+]+\\)[[:blank:]]*\\(\\s-.+\\)"
                -1 0 nil))

(defun sa/align-current-at-right ()
  "Aligns the first column of each line of the current paragraph at right."
  (interactive)
  (save-excursion
    (mark-paragraph)
<<<<<<< local
    (sa/align-region-at-right)))


(defun sa/eval-and-replace (value)
  "Evaluate the sexp at point and replace it with its value"
  (interactive (list (eval-last-sexp nil)))
  (kill-sexp -1)
  (insert (format "%S" value)))
=======
    (align-region-at-right)))>>>>>>> other
