(require 'org-publish)

(setq org-link-abbrev-alist
      '(("blog" . "http://dl.dropbox.com/u/4429200/blog/")))

(setq org-publish-project-alist
      '(("blog-source"
         :base-directory "~/www/sorellas-basement/source"
         :base-extension "org"
         :publishing-directory "~/www/sorellas-basement"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 6
         :html-extension "html"
         :table-of-contents 6
         :body-only t)

        ("blog-static"
         :base-directory "~/www/sorellas-basement/source"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|xml"
         :publishing-directory "~/www/sorellas-basement"
         :recursive t
         :publishing-function org-publish-attachment)

        ("blog"
         :components ("blog-source" "blog-static"))))
