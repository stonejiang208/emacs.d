;;; Package --- userconfig
;;; Commentary:

;;; Code:

;;----------------------------------------------------------------------------
;; %匹配括号 ，删除一对括号，键绑定
;;----------------------------------------------------------------------------
(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
((looking-at "\\s\)") (forward-char 1) (backward-list 1))
    (t (self-insert-command (or arg 1)))))
;; end [] match

(global-set-key [C-backspace] 'delete-pair)

;;----------------------------------------------------------------------------
;; 绑定M-0为切换h/cpp方法
;;----------------------------------------------------------------------------
(global-set-key "\260" 'ff-find-other-file)


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

(set-default-font "Monaco 10")
(set-fontset-font "fontset-default" 'unicode"STHeiti 12")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; unicad.el 让 Emacs 自动识别文件编码
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'unicad)
(setq file-name-coding-system 'utf-8)
(setq-default coding-system-history '("utf-8" "gb2312" "latin-2" "latin-1" "gbk"))

;;----------------------------------------------------------------------------
;; cscope
;;----------------------------------------------------------------------------
(require 'xcscope)
(cscope-setup)
;;关闭自动更新数据库，加快查找速度
(setq cscope-do-not-update-database t)

;;----------------------------------------------------------------------------
;; evil
;;----------------------------------------------------------------------------
(require 'evil)
(evil-mode 0)

;;----------------------------------------------------------------------------
;; 默认显示行号
;;----------------------------------------------------------------------------
(global-linum-mode 1)
(autoload 'thumbs "thumbs" "Preview images in a directory." t)

;;----------------------------------------------------------------------------
;;;;picture
;;----------------------------------------------------------------------------
(setq octopress-image-dir (expand-file-name "~/octopress/source/imgs/"))
(setq octopress-image-url "/imgs/")

(defun my-screenshot (dir_path)
  "Take a screenshot and save it to dir_path path.
Return image filename without path so that you can concat with your
opinion. "
  (interactive)
  (let* ((full-file-name
          (concat (make-temp-name (concat dir_path (buffer-name) "_" (format-time-string "%Y%m%d_%H%M%S_"))) ".png"))
         (file-name (my-base-name full-file-name))
         )
    (call-process-shell-command "scrot" nil nil nil (concat "-s " "\"" full-file-name "\""))
    file-name
    ))

;; Screenshot
(defun markdown-screenshot (arg)
  "Take a screenshot for Octopress"
  (interactive "P")
  (let* ((dir_path octopress-image-dir)
   (url (concat octopress-image-url (my-screenshot dir_path))))
    (if arg
  (insert "![](" url ")")
      (insert "{% img " url " %}"))))
;;

;; base on http://emacswiki.org/emacs/CopyAndPaste
(defun get-clipboard-contents-as-string ()
    "Return the value of the clipboard contents as a string."
    (defun get-clipboard-contents-as-string ()
    "Return the value of the clipboard contents as a string."
    (let ((x-select-enable-clipboard t))
      (or (if (fboundp 'x-cut-buffer-or-selection-value) (x-cut-buffer-or-selection-value))
          (if (fboundp 'x-last-selected-text-clipboard) x-last-selected-text-clipboard)
          (if (fboundp 'pbcopy-selection-value) (pbcopy-selection-value))
          )
      ))
)

(defun copy-file-from-clipboard-to-path (dst-dir)
  "copy file to desired path from clipboard"
  (interactive)
  (let* ((full-file-name) (file-name) (ext) (new-file-name))
    (setq full-file-name (get-clipboard-contents-as-string))
    (if (eq (search "file://" full-file-name) 0)
  (progn
    (setq full-file-name (substring full-file-name 7))
    (setq file-name (my-base-name full-file-name))
    (setq ext (concat "." (file-name-extension file-name)))
    (setq new-file-name
      (concat (make-temp-name
           (concat (substring file-name 0
                      (search "." file-name :from-end t))
               (format-time-string "_%Y%m%d_%H%M%S_"))) ext))
    (setq new-full-file-name (concat dst-dir new-file-name))
    (copy-file full-file-name new-full-file-name)
    new-file-name
    )
      )))

;; Insert Image From Clip Board
(defun markdown-insert-image-from-clipboard (arg)
  "Insert an image from clipboard and copy it to disired path"
  (interactive "P")
  (let ((url (concat octopress-image-url (copy-file-from-clipboard-to-path octopress-image-dir))))
    (if arg
  (insert "![](" url ")")
      (insert "{% img " url " %}"))))

;;----------------------------------------------------------------------------
;; tab to space
;;----------------------------------------------------------------------------
;;(setq  indent-tabs-mode nil)
;;(set-default 'tab-width 4)
;;(setq tab-width 4)
;;(loop for x downfrom 40 to 1 do
;;      (setq tab-stop-list (cons (* x (default-value tab-width)) tab-stop-list)))



;;----------------------------------------------------------------------------
;; mew -- mail
;;----------------------------------------------------------------------------
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
;; Optional setup (Read Mail menu for Emacs 21):
(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))
;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))

;;----------------------------------------------------------------------------
;; emms
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/elisp/emms/")
(require 'emms-setup)
(emms-standard)
(emms-default-players)
;;评分
(require 'emms-score)
(emms-score 1)
;; autodetect musci files id3 tags encodeing
(require 'emms-i18n)
;; auto-save and import last playlist
(require 'emms-history)

;; global key-map
;; all global keys prefix is C-c e
;; compatible with emms-playlist mode keybindings
;; you can view emms-playlist-mode.el to get details about
;; emms-playlist mode keys map
(global-set-key (kbd "C-c e q") 'emms-stop)
(global-set-key (kbd "C-c e SPC") 'emms-pause)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd "C-c e p") 'emms-previous)
(global-set-key (kbd "C-c e f") 'emms-show)
(global-set-key (kbd "C-c e >") 'emms-seek-forward)
(global-set-key (kbd "C-c e <") 'emms-seek-backward)
;; these keys maps were derivations of above keybindings
(global-set-key (kbd "C-c e s") 'emms-start)
(global-set-key (kbd "C-c e g") 'emms-playlist-mode-go)
(global-set-key (kbd "C-c e t") 'emms-play-directory-tree)
(global-set-key (kbd "C-c e h") 'emms-shuffle)
(global-set-key (kbd "C-c e e") 'emms-play-file)
(global-set-key (kbd "C-c e d") 'emms-play-dired)
(global-set-key (kbd "C-c e l") 'emms-play-playlist)
(global-set-key (kbd "C-c e r") 'emms-toggle-repeat-track)
(global-set-key (kbd "C-c e R") 'emms-toggle-random-playlist)
(global-set-key (kbd "C-c e u") 'emms-score-up-playing)
(global-set-key (kbd "C-c e o") 'emms-score-show-playing)

;;----------------------------------------------------------------------------
;; 高亮当前行
;;----------------------------------------------------------------------------
(global-hl-line-mode 1)


;;----------------------------------------------------------------------------
;; w3m
;;----------------------------------------------------------------------------
;; 设置w3m主页
(setq w3m-home-page "http://www.baidu.com")

;; 默认显示图片
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)

;; 使用cookies
(setq w3m-use-cookies t)

;;设定w3m运行的参数，分别为使用cookie和使用框架
(setq w3m-command-arguments '("-cookie" "-F"))

;; 使用w3m作为默认浏览器
(setq browse-url-browser-function 'w3m-browse-url)
(setq w3m-view-this-url-new-session-in-background t)


;;显示图标
(setq w3m-show-graphic-icons-in-header-line t)
(setq w3m-show-graphic-icons-in-mode-line t)

;;C-c C-p 打开，这个好用
(setq w3m-view-this-url-new-session-in-background t)


(add-hook 'w3m-fontify-after-hook 'remove-w3m-output-garbages)
(defun remove-w3m-output-garbages ()
"去掉w3m输出的垃圾."
(interactive)
(let ((buffer-read-only))
(setf (point) (point-min))
(while (re-search-forward "[\200-\240]" nil t)
(replace-match " "))
(set-buffer-multibyte t))
(set-buffer-modified-p nil))

;;----------------------------------------------------------------------------
;;tea-time
;;----------------------------------------------------------------------------
(require 'tea-time)
(setq tea-time-sound "~/Music/ring.m4r")
(setq tea-time-sound-command "afplay %s")

;;----------------------------------------------------------------------------
;; 中文日历
;;----------------------------------------------------------------------------
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-important-holidays)

;;----------------------------------------------------------------------------
;; CEDET
;;----------------------------------------------------------------------------
(require 'semantic)
;; Enable EDE (Project Management) features
(global-ede-mode 1)                      ; Enable the Project management system

;;----------------------------------------------------------------------------
;; 自动换行
;;----------------------------------------------------------------------------
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;----------------------------------------------------------------------------
;; 显示时间
;;----------------------------------------------------------------------------
;;启用时间显示设置，在minibuffer上面的那个杠上
(display-time-mode 1)
;;时间使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;;时间栏旁边启用邮件设置
(setq display-time-use-mail-icon nil)
;;时间的变化频率
(setq display-time-interval 10)
;;显示时间的格式
;;(setq display-time-format nil)

;;----------------------------------------------------------------------------
;; dictionary
;;----------------------------------------------------------------------------
(require 'dictionary)
;; key binding
(global-set-key (kbd "C-c d") 'dictionary-search-pointer)

;;----------------------------------------------------------------------------
;; 性感尾巴
;;----------------------------------------------------------------------------
(require 'highlight-tail)
(message "Highlight-tail loaded - now your Emacs will be even more sexy!")
(setq highlight-tail-colors '(("black" . 0)
                              ("#bc2525" . 25)
                              ("black" . 66)))
(highlight-tail-mode)


;;----------------------------------------------------------------------------
(provide 'init-local)
