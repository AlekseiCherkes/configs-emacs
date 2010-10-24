;; Главная папка с emacs-конфигами.
;; Единственное, что должно редактироватся при установке на свежую OS.
(setq my-emacs-dir "~/Dropbox/configs/emacs/")

;; Загружаем стартовый скрипт.
(load (concat my-emacs-dir "my-emacs.el"))