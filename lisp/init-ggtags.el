(require-package 'ggtags)

(ggtags-mode 1)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(provide 'init-ggtags)
