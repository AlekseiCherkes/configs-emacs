; Устанавливаем файл для custom settings.
(setq custom-file "~/emacs/my-custom.el")
(load custom-file 'noerror)

; Дирректории с elisp кодом.
(setq load-path (cons "~/emacs/" load-path))
(setq load-path (cons "~/emacs/site-packages" load-path))

; Загружаем остальные модули.
(load "my-basics.el")
(load "my-color-theme.el")
(load "my-other.el")

; Режимы редактирования
(load "my-mode-c.el")
(load "my-mode-haskell.el")
(load "my-mode-cmake.el")

; Запускаем программы
(load "my-autorun.el")