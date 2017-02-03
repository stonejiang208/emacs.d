(require-package 'ycmd)
(require 'ycmd)
(add-hook 'c++-mode-hook 'ycmd-mode)

;;;; need change to your own path
(set-variable 'ycmd-server-command '("python" "/Users/emuio/git/ycmd/ycmd/"))
(set-variable 'ycmd-global-config "/Users/emuio/git/ycmd/examples/.ycm_extra_conf.py")

;;;; Completion framework
(require-package 'company-ycmd)
(require 'company-ycmd)
(company-ycmd-setup)

;;;; Enable flycheck
(require-package 'flycheck-ycmd)
(require 'flycheck-ycmd)
(flycheck-ycmd-setup)

(provide 'init-ycmd)
