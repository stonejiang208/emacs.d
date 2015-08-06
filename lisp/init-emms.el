;;----------------------------------------------------------------------------
;; emms
;;----------------------------------------------------------------------------
(require-package 'emms)
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

(provide 'init-emms)
