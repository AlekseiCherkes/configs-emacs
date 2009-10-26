; Устанавливаем файл для custom settings.
(setq custom-file "~/emacs/my-custom.el")
(load custom-file 'noerror)

; Дирректории с elisp кодом.
(setq load-path (cons "~/emacs/" load-path))

; Загружаем остальные модули.
(load "my-basics.el")
