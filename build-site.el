(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))



;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)


(require 'ox-publish)


(setq org-html-validation-link nil
      org-html-head-include-scripts nil       ;; scripts
      org-html-head-include-default-style nil ;; styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")


(setq org-publish-project-alist
      (list
       (list "my-org-site"
             :recursive t
             :base-directory "./content/"
             :publishing-directory "./public"
             :publishing-function 'org-html-publish-to-html
             :with-author t
             :with-creator t
             :with-toc nil
             :section-numbers nil
             :time-stamp-file nil
             )))

(org-publish-all t)
(message "Build complete")








