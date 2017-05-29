;;; init-local.el --- userconfig
;;; Commentary:

;;; Code:
(setq c-default-style "ellemtel")
(require 'mpc-mode)
(require 'template)
(require 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S by %u")
;;
(require 'template)
(template-initialize)
(setq template-default-directories
      '("~/.emacs.d/templates/"))
(setq select-enable-clipboard t)
(setq tab-width 2)
(setq default-tab-width 2)
(setq c-basic-offset 2)

;;----------------------------------------------------------------------------
(provide 'init-local)
