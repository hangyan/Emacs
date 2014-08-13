;emms
(add-to-list 'load-path "~/Emacs/emms")
(require 'emms-setup)
(emms-standard)
(emms-default-players)


; doubanfm
(autoload 'douban-music "douban-music-mode" nil t)


(provide 'my-mime)
