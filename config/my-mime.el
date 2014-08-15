;emms
(add-to-list 'load-path "~/Emacs/emms")
(require 'emms-setup)
(emms-standard)
(emms-default-players)


; doubanfm
(autoload 'douban-music "douban-music-mode" nil t)

; image
(auto-image-file-mode)
(setq w3m-default-display-inline-images t)
(autoload 'thumbs "thumbs" "Preview images in a directory." t)

; autoview
(add-hook 'doc-view-mode-hook
	    (lambda ()
	          (linum-mode -1)
		    ))

(provide 'my-mime)
