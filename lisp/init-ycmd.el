(require-package 'ycmd)
(require 'ycmd)
(add-hook 'c++-mode-hook 'ycmd-mode)

;;;; need change to your own path
(set-variable 'ycmd-server-command '("python" "/Users/jiangtao/live-src/ycmd/ycmd"))
(set-variable 'ycmd-global-config "/Users/jiangtao/.emacs.d/.ycm_extra_conf.py")
;;;; Completion framework
(require-package 'company-ycmd)
(require 'company-ycmd)
(company-ycmd-setup)

;;;; Enable flycheck
(require-package 'flycheck-ycmd)
(require 'flycheck-ycmd)
(flycheck-ycmd-setup)

(provide 'init-ycmd)
