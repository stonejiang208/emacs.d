(require-package 'go-mode)
(unless (version< emacs-version "24.3")
  (require-package 'company-go))


(setenv "GOPATH" "~/go")


(provide 'init-go)
