;;----------------------------------------------------------------------------
;; %匹配括号 ，删除一对括号，键绑定
;;----------------------------------------------------------------------------

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
;; end

;;(global-set-key "%" 'match-paren) ;;暂不开启
(global-set-key [C-backspace] 'delete-pair)

;;----------------------------------------------------------------------------
;; 绑定M-0为切换h/cpp方法
;;----------------------------------------------------------------------------
(global-set-key "\260" 'ff-find-other-file)

;;; dos2unix and clean whitespace
(defun dos2unix ()
  "Replace DOS eolns CR LF with Unix eolns CR."
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match ""))
  (whitespace-cleanup))

(provide 'init-custom-function)
