;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PYTHON
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq python-python-command "python")

(defun my-python-compile ()
  "Use compile to run python programs"
  (interactive)
  (compile (concat "python " (buffer-name))))
(setq compilation-scroll-output t)

(autoload 'python-mode "python" "Python mode" t)
;(autoload 'pair-mode "pair-mode" "Pair Mode" t)
(setq auto-mode-alist
    (cons '("\\.py$" . python-mode) auto-mode-alist))

(add-hook 'python-mode-hook
    '(lambda ()
     ;  (pair-mode 1)
        (eldoc-mode 1)
        (outline-minor-mode 1)
	(local-set-key "\C-c\C-c" 'my-python-compile)
      t))

;; FlyMakes will use pyflakes

;; (when (load "flymake" t) 
;;   (defun flymake-pyflakes-init () 
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy 
;; 		       'flymake-create-temp-inplace)) 
;; 	   (local-file (file-relative-name 
;; 			temp-file 
;; 			(file-name-directory buffer-file-name))
;; 		       )
;; 	   ) 
;;       (list "pyflakes" (list local-file))
;;       )
;;     ) 
  
;;   (add-to-list 'flymake-allowed-file-name-masks 
;; 	       '("\\.py\\'" flymake-pyflakes-init)
;; 	       )
;;   ) 

;; (add-hook 'find-file-hook 'flymake-find-file-hook)

;; (custom-set-faces '(flymake-errline ((((class color)) (:background "brown" :foreground "black")))))
;; (custom-set-faces '(flymake-warnline ((((class color)) (:background "MediumPurple" :foreground "black")))))

;; ;; Rope refactoring
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")
