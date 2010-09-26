;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/emacs/site-packages/org-mode/lisp")
(add-to-list 'load-path "~/emacs/site-packages/org-mode/contrib/lisp")

(require 'org-install)
(org-reload) ; we don't need default emacs version

;; With this setup, all files with extension ‘.org’ 
;; will be put into Org mode.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) 

;; not needed when global-font-lock-mode is on 
;(add-hook 'org-mode-hook 'turn-on-font-lock) 

;; The last three lines define global keys for some 
;; commands — please choose suitable keys yourself.
(global-set-key "\C-cl" 'org-store-link) 
(global-set-key "\C-ca" 'org-agenda) 
(global-set-key "\C-cb" 'org-iswitchb)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
