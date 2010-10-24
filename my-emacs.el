; Дирректории с elisp кодом.
(setq my-emacs-site-lisp-dir (concat my-emacs-dir "site-packages/"))

(add-to-list `load-path my-emacs-dir)
(add-to-list `load-path my-emacs-site-lisp-dir)

(defun my-add-site-lisp (dir)
  (add-to-list `load-path (concat my-emacs-site-lisp-dir dir)))

; Устанавливаем файл для custom settings.
(setq custom-file (concat my-emacs-dir "my-custom.el"))
(load custom-file 'noerror)

; Загружаем остальные модули.
(load "my-basics.el")
(load "my-color-theme.el")
(load "my-other.el")
(load "my-logtailng.el")

; Режимы редактирования
(load "my-mode-c.el")
(load "my-mode-haskell.el")
(load "my-mode-cmake.el")
(load "my-mode-python.el")
(load "my-mode-slime.el")
(load "my-mode-org.el")
(load "my-mode-asciidoc.el")

; Запускаем программы
(load "my-autorun.el")