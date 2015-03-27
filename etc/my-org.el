;;; indent
(setq org-startup-indented t)

(setq org-src-fontify-natively t)


;; iimage mode
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)


(setq org-publish-project-alist
      '(("orgfiles"
         :base-directory "~/org/"
         :base-extension "org"
         :publishing-directory "~/html"
         :publishing-function org-publish-org-to-html
         :exclude "private.org"   ;; regexp
         :headline-levels 3
         :section-numbers nil
         :with-toc nil
         :auto-sitemap t
         :sitemap-filename "sitemap.org"
         :sitemap-title "Sitemap"
         :recursive t
         :html-head "<link rel=\"stylesheet\"
                       href=\"/home/yuyan/org/css/org.css\" type=\"text/css\"/>"
         :html-preamble t)

        ("images"
         :base-directory "~/org/img/"
         :base-extension "jpg\\|gif\\|png"
         :publishing-directory "~/html/image"
         :publishing-function org-publish-attachment)

        ("org-note" :components ("orgfiles" "images"))))


(provide 'my-org)
