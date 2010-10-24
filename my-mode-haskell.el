(my-add-site-lisp "haskell-mode/")
(load "haskell-site-file.el")

;; Даётся три режима выравнивания на выбор.
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(defun my-haskell-mode-hook()
  (setq haskell-font-lock-symbols t)) ;; отображение математических символов вместо текста

(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
