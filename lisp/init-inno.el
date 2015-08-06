;;----------------------------------------------------------------------------
;; inno
;;----------------------------------------------------------------------------
(require-package 'iss-mode)
(require 'iss-mode)
(add-to-list 'auto-mode-alist '("\\.iss$"  . iss-mode))

(provide 'init-inno)
