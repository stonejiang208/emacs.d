;;----------------------------------------------------------------------------
;; cscope
;;----------------------------------------------------------------------------
(require-package 'xcscope)
(require 'xcscope)
(cscope-setup)
;;关闭自动更新数据库，加快查找速度
(setq cscope-do-not-update-database t)

(provide 'init-cscope)
