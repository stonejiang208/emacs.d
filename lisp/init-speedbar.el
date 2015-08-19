;;----------------------------------------------------------------------------
;; speedbar
;;----------------------------------------------------------------------------

;;关闭行号
(add-hook 'sr-speedbar-mode-hook '(lambda () (linum-mode -1)))

(require-package 'sr-speedbar)
(add-hook 'after-init-hook '(lambda () (sr-speedbar-toggle)));;开启程序即启用

;;speedbar 使用etags
(setq speedbar-use-imenu-flag nil)

;; 让speedbar使用semantic的分析结果
(require 'semantic/sb)

(provide 'init-speedbar)
