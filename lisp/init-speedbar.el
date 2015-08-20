;;----------------------------------------------------------------------------
;; speedbar
;;----------------------------------------------------------------------------

(require-package 'sr-speedbar)

;;关闭行号
(add-hook 'sr-speedbar-mode-hook '(lambda () (linum-mode -1)))

;;开启程序即启用
;;(add-hook 'after-init-hook '(lambda () (sr-speedbar-toggle)))

;;speedbar 使用etags
(setq speedbar-use-imenu-flag nil)

;; 让speedbar使用semantic的分析结果
(require 'semantic/sb)

;; shortcut
(define-key global-map "\C-cmt" 'sr-speedbar-toggle)

(provide 'init-speedbar)
