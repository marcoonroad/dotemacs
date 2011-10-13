(defun sorella/trim (str)
  (replace-regexp-in-string "^[[:space:]]*\\|[[:space:]]*$" "" str))


(defun sorella/css-propertyp (property)
  "Checks if something can be considered a CSS property."
  (or (string= "-" (substring property 0 1))
      (member (downcase property) css-property-ids)))


(defun sorella/css-prettify-selectors (selectors)
  "Returns a properly sorted string with selectors."
  (concat (replace-regexp-in-string " *, *"
                                    (concat ",\n")
                                    selectors)
          " {"))


(defun sorella/css-fix-property-spacing ()
  "Converts things like 'color:x' to `color: x'.

It expects a properly indented CSS"
  (interactive)
  (save-excursion)
  (goto-char (point-min))
  (while (re-search-forward "^ *\\([^:]+\\) *: *" nil t)
    (if (sorella/css-propertyp (match-string 1))
        (replace-match (concat "    "
                               (match-string 1)
                               ": ")))))


(defun sorella/css-indent-buffer ()
  "Indents the whole buffer correctly."
  (interactive)
  (indent-region (point-min) (point-max)))


(defun sorella/css-unminify ()
  "Unminifies the whole CSS."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "{" nil t)
      (replace-match "{\n")))
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "}" nil t)
      (replace-match "\n}\n")))
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward ";" nil t)
      (replace-match ";\n")))
  (sorella/css-indent-buffer)
  (sorella/css-align-properties))


(defun sorella/css-align-properties ()
  "Aligns the properties with align-region"
  (interactive)
  (align-regexp (point-min) (point-max) "^ +\\([^:]+ *\\)\\(: *\\) " 2 1 nil))


(defun sorella/css-fix-selectors ()
  "Uses one selector per line"
  (interactive)
  (save-excursion)
  (goto-char (point-min))
  (while (re-search-forward "^\\(.+\\) *{ *" nil t)
    (replace-match (sorella/css-prettify-selectors (match-string 1)))))


(defun sorella/css-fix-brace-spacing ()
  "Fixes brace spacing"
  (interactive)
  (save-excursion)
  (goto-char (point-min))
  (while (re-search-forward " *{ *$" nil t)
    (replace-match " {")))


(defun sorella/css-remove-semicolons ()
  "Removes semicolons from the end of the line to make it moar clean."
  (interactive)
  (save-excursion)
  (goto-char (point-min))
  (while (re-search-forward " *; *$" nil t)
    (replace-match "")))


(defun sorella/css-fix-formatting ()
  "Fixes all the formatting in the file."
  (interactive)
  (sorella/css-fix-selectors)
  (sorella/css-indent-buffer)
  (sorella/css-fix-property-spacing)
  (sorella/css-fix-brace-spacing)
  (sorella/css-align-properties))



(defun sorella/css->stylus ()
  "Converts a css file to stylus"
  (interactive)
  (sorella/css-fix-formatting)
  (sorella/css-remove-semicolons))