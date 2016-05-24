;;----------------------------------------------------------------------------
;; cscope
;;----------------------------------------------------------------------------
(require-package 'xcscope)
(require 'xcscope)
(cscope-setup)
;;关闭自动更新数据库，加快查找速度
(setq cscope-do-not-update-database t)

;; java自动打开cscope-mode
(add-hook 'java-mode-hook (function cscope-minor-mode))

;; python mode支持
(add-hook 'python-mode-hook (function cscope-minor-mode))

(provide 'init-cscope)
