(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(require-package 'elpy)
(elpy-enable)

(provide 'init-python-mode)
