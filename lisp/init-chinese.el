;;----------------------------------------------------------------------------
;; 支持中文斜体的显示
;;----------------------------------------------------------------------------
;;(set-frame-font "Source Code Pro-12")
;;(set-fontset-font "fontset-default" (quote gb18030) (quote ("STHeiti" . "unicode-bmp")))
;;(set-language-environment 'Chinese-GB)

;;(set-keyboard-coding-system 'euc-cn)
;;(set-clipboard-coding-system 'euc-cn)
;;(set-terminal-coding-system 'euc-cn)
;;(set-buffer-file-coding-system 'euc-cn)
;;(set-selection-coding-system 'euc-cn)
;;(prefer-coding-system 'euc-cn)
;;(setq default-process-coding-system 'euc-cn)
;;(setq-default pathname-coding-system 'euc-cn)

(when *is-a-mac*
  (set-default-font "Monaco 12"))
;;(set-fontset-font "fontset-default" 'unicode"STHeiti 14")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; unicad.el 让 Emacs 自动识别文件编码
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'unicad)
(setq file-name-coding-system 'utf-8)
(setq-default coding-system-history '("utf-8" "gb2312" "latin-2" "latin-1" "gbk"))

;;----------------------------------------------------------------------------
;; 中文日历
;;----------------------------------------------------------------------------
(require-package 'cal-china-x)
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-important-holidays)

(provide 'init-chinese)
;;; init-chinese.el ends here
