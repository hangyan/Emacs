;emms
(add-to-list 'load-path "~/Emacs/emms")
(require 'emms-setup)
(emms-standard)
(emms-default-players)


; doubanfm
(autoload 'douban-music "douban-music-mode" nil t)

; image
(autoload 'thumbs "thumbs" "Preview images in a directory." t)


(provide 'my-mime)
