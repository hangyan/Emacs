;;; elfeed-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (elfeed-export-opml elfeed-load-opml elfeed elfeed-update)
;;;;;;  "elfeed" "elfeed.el" (21494 43988 541957 671000))
;;; Generated autoloads from elfeed.el

(autoload 'elfeed-update "elfeed" "\
Update all the feeds in `elfeed-feeds'.

\(fn)" t nil)

(autoload 'elfeed "elfeed" "\
Enter elfeed.

\(fn)" t nil)

(autoload 'elfeed-load-opml "elfeed" "\
Load feeds from an OPML file into `elfeed-feeds'.
When called interactively, the changes to `elfeed-feeds' are
saved to your customization file.

\(fn FILE)" t nil)

(autoload 'elfeed-export-opml "elfeed" "\
Export the current feed listing to OPML-formatted FILE.

\(fn FILE)" t nil)

;;;***

;;;### (autoloads nil nil ("elfeed-db.el" "elfeed-lib.el" "elfeed-pkg.el"
;;;;;;  "elfeed-search.el" "elfeed-show.el" "xml-query.el") (21494
;;;;;;  43988 646626 231000))

;;;***

(provide 'elfeed-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; elfeed-autoloads.el ends here
