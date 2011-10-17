;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(defun sorella/htmlise ()
  (interactive)
  (sorella/make-headings)
  (sorella/make-paragraphs)
  (sorella/make-strong)
  (sorella/make-lists))


(defun sorella/make-paragraphs ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^\n\n" nil t)
      (replace-match "\n\n<p>"))))

(defun sorella/make-strong ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^\\(.+:\\) *$" nil t)
      (replace-match (concat "<strong>"
                             (match-string 1)
                             "</strong>")))))

(defun sorella/make-lists ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^\n• +" nil t)
      (replace-match "<ul>\n<li>")))
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^• +" nil t)
      (replace-match "<li>"))))
               

(defun sorella/heading-level (prefix)
  (number-to-string (length prefix)))

(defun sorella/make-headings ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^\\(##+\\) *\\(.+\\)$" nil t)
      (let ((level (sorella/heading-level (match-string 1))))
        (replace-match (concat "<h" level ">"
                               (match-string 2)
                               "</h" level ">"))))))