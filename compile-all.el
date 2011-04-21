;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Build script for my emacs configuration.
;;
;; Make sure you've read the GODDAMN read-me. Because that's what they're for
;; :3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar builder-column-size 52)

(defun builder-get-colour (name)
  (let ((colours '(("black"  0)
                   ("red"    1)
                   ("green"  2)
                   ("orange" 3)
                   ("blue"   4)
                   ("pink"   5)
                   ("cian"   6)
                   ("white"  7))))
    (+ (or (cadr (assoc name colours))
           9)
       30)))

(defun builder-print (message &optional colour)
  (message "\033[0;%dm%s\033[0m" (builder-get-colour colour) message))

(defun builder-print-header (message)
  (builder-print "")
  (builder-print (make-string 60 ?=) "blue")
  (builder-print message             "blue")
  (builder-print (make-string 60 ?=) "blue"))

(defun builder-print-footer (&optional colour)
  (builder-print "")
  (builder-print (make-string 60 ?-) colour))

(defun builder-print-fatal (message)
  (builder-print-footer "pink")
  (builder-print (format "› Error:\n  %s" message) "pink"))

(defun builder-print-fail (message)
  (builder-print-footer "orange")
  (builder-print (format "› Warning:\n  %s" message) "orange"))

(defun builder-print-success (message)
  (builder-print-footer "green")
  (builder-print (format "› %s" message) "green"))

(defun builder-padded (text offset)
  (concat text (make-string (+ (- builder-column-size
                                  (length text))
                               offset)
                            ? )))

(defun builder-dep-status (text status &optional colour)
  (builder-print (concat (builder-padded text (- 6 (length status)))
                         "[" status "]")
                 colour))

(defun builder-dep-ok (text)
  (builder-dep-status text "OK" "green"))

(defun builder-dep-error (text)
  (builder-dep-status text "ERROR" "red"))

(defun builder-dep-fail (text)
  (builder-dep-status text "FAILED" "orange"))

(defun builder-dep-skipped (text)
  (builder-dep-status text "SKIPPED" "orange")) 

(defun builder-check-dep (ok thing version &optional required)
  (let ((text (format "%s %s" thing version)))
    (cond (ok        (builder-dep-ok    text) t)
          (required  (builder-dep-error text) nil)
          (t         (builder-dep-fail  text) t))))

(defun builder-compare-versions (ver1 ver2)
  (let ((left  (or (car ver1) 0))
        (right (or (car ver2) 0)))
    (cond ((< left right) -1)
          ((> left right)  1)
          ((>= (or (length ver1) (length ver2)) 1)
           (builder-compare-versions (cdr ver1) (cdr ver2))))))

(defun builder-version-ok? (ver1 ver2)
  (let ((result (builder-compare-versions ver1 ver2)))
    (or (eq result 1)
        (eq result nil))))

(defun builder-version-number (version-string)
  (mapcar (lambda (x) (string-to-number x))
          (split-string version-string "\\.")))

(defun builder-get-version (software)
  (builder-version-number
   (with-temp-buffer
     (call-process software nil t nil "--version")
     (goto-char (point-min))
     (if (re-search-forward "[0-9]+\\.[0-9]+\\(\\.[0-9]+\\)?" nil t)
         (match-string 0)
       ""))))

(defun builder-check-version (software expected-version)
  (ignore-errors
    (builder-version-ok? (builder-get-version    software)
                         (builder-version-number expected-version))))

(defun builder-check-bin (software version &optional required)
  (builder-check-dep (builder-check-version software version)
                       software version required))

(defun builder-check-emacs (expected-version)
  (builder-check-dep
   (builder-version-ok? (builder-version-number emacs-version)
                        (builder-version-number expected-version))
   "emacs" expected-version t))

(defun builder-check-lib (libname &optional required)
  (builder-check-dep (load libname 'noerror 'nomessage)
                     libname "" required))

(defun builder-check-lib-deps ()
  (builder-print "")
  t)

(defun builder-check-bin-deps ()
  (and (builder-check-bin "git"   "1.7"  t)
       (builder-check-bin "svn"   "1.6"  t)
       (builder-check-bin "make"  "3.0"  t)
       ;; Optional
       (builder-check-bin "node"   "0.4.2")
       (builder-check-bin "coffee" "1.0")))

(defun builder-check-all-deps ()
  (builder-print-header "-- Checking dependencies...")
  (and (builder-check-emacs "22.0")
       (builder-check-bin-deps)
       (builder-check-lib-deps)))

(defun builder-vcs-get (vcs &rest args)
  (builder-print (format "› %s: at %s" vcs (cadr args)) "cian")
  (apply 'call-process vcs nil nil t args))

(defun builder-svn-checkout (uri &optional dir)
  (apply 'builder-vcs-get "svn" "checkout" uri dir '()))

(defun builder-git-clone (uri &optional dir)
  (apply 'builder-vcs-get "git" "clone" uri dir '()))

(defun builder-download-vcs-uri (uri vcs dir)
  (if (file-exists-p dir)
      'skipped
    (cond ((string= vcs "svn") (builder-svn-checkout uri dir))
          ((string= vcs "git") (builder-git-clone    uri dir)))))

(defun builder-check-and-download (uri vcs dir)
  (let ((result (builder-download-vcs-uri uri vcs dir))
        (msg    (format "[%s] repository in %s" vcs dir)))
    (cond ((eq result 'skipped) (builder-dep-skipped msg))
          ((eq result 0)        (builder-dep-ok      msg))
          (t                    (builder-dep-error   msg)))))

(defun builder-download-stuff ()
  (builder-print-header "-- Getting stuff from the interwebz...")
  (with-temp-buffer
    (find-file-literally ".hgsub")
    (goto-char (point-min))
    (while (re-search-forward "\\(.+?\\) *= *\\[\\(.+?\\)\\]\\(.+\\)" nil t)
      (let ((dir (match-string 1))
            (vcs (match-string 2))
            (uri (match-string 3)))
        (builder-check-and-download uri vcs dir)))))

(defun builder-byte-compile ()
  (builder-print-header "-- Byte compiling *EVERYTHING*...")
  (let ((root default-directory))
    (byte-recompile-directory (concat root "sorella"))
    (byte-recompile-directory (concat root "vendor"))))

;;
;; Makes everything
;;
(defun builder-make (proc)
  (if (builder-check-all-deps)
      (progn
        (eval proc)
        (builder-print-success "Build completed successfully"))
    (builder-print-fatal "Some required dependencies are missing.")))

(defun builder-make-all ()
  (builder-make
   '(progn
      (builder-download-stuff)
      (builder-byte-compile))))

