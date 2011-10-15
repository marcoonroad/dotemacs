;;; Routines for dealing with pure text


(defun align-region-at-right ()
  "Aligns the first column of each line at right.

The function treats every line in the region as a two-column line, splitting
at the first whitespace after an identifier."
  (interactive)
  (align-regexp (region-beginning) (region-end)
                "^[[:blank:]]*\\([[:alnum:],<>/=&!\\-\\?\\+]+\\)[[:blank:]]*\\(\\s-.+\\)"
                -1 0 nil))

(defun align-current-at-right ()
  "Aligns the first column of each line of the current paragraph at right."
  (interactive)
  (save-excursion
    (mark-paragraph)
    (align-region-at-right)))


(defun eval-and-replace (value)
  "Evaluate the sexp at point and replace it with its value"
  (interactive (list (eval-last-sexp nil)))
  (kill-sexp -1)
  (insert (format "%S" value)))
