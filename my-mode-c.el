;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(global-set-key [C-f9] 'c-indent-defun)

(defun my-c-mode-common-setup ()
  (setq c-basic-offset 4) ;; We want to stick to KStars' indentation standards
  (setq indent-tabs-mode nil) ;; TABs for indentation, please!
  ;(setq compile-command "makefromemacs") ;; Change compile command
  ;(define-key c-mode-base-map (kbd "C-c c") 'compile) ;; Bind C-c c to (compile)
  ;(setup-ebrowse-bindings) ;; Set up EBrowse bindings
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-setup)

; Добавляем файлы шейдеров в c-mode
(add-to-list 'auto-mode-alist '("\\.\\(fx\\|inc\\)\\'" . c++-mode))

;(add-to-list 'auto-mode-alist '("\\.[ch]\\(pp\\|xx\\|\\+\\+\\)\\'" . c++-mode))
;(add-to-list 'auto-mode-alist '("\\.\\(CC?\\|HH?\\)\\'" . c++-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
