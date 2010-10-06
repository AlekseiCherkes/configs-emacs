;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'Info-directory-list "~/emacs/site-packages/org-mode/doc")

(add-to-list 'load-path "~/emacs/site-packages/org-mode/lisp")
(add-to-list 'load-path "~/emacs/site-packages/org-mode/contrib/lisp")

(require 'org-install)
(org-reload) ; we don't need default emacs version

;; With this setup, all files with extension ‘.org’ 
;; will be put into Org mode.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) 

;; not needed when global-font-lock-mode is on 
;(add-hook 'org-mode-hook 'turn-on-font-lock)

;; GDT

(setq org-use-property-inheritance t)

(setq org-directory 
      (if (eq system-type `windows-nt)
	  "~/Dropbox/Org/"
	"~/Dropbox/Org/"))

(setq org-agenda-files 
	     (mapcar (lambda (x) (concat org-directory x)) 
		     `("next.org" "calendar.org" "waiting.org")))

(defun my-org ()
  (interactive)
  (dired org-directory))

(setq org-agenda-custom-commands
      '(("h" "Agenda and Home-related tasks"
	 ((agenda "")
	  (tags "CATEGORY=\"waiting\"")
	  (tags "CATEGORY=\"next\"" 
		((org-agenda-prefix-format "  %-12:T")
		 (org-agenda-sorting-strategy '(tag-up))))
	 nil
	 '("~/Dropbox/Org/agenda_export.html")))))

;; (setq my-context-list ("home" "work"))

;; &Context=\"home\""

;; 	  (mapcar (lambda (x) '(tags (concat "CATEGORY=\"next\"&Context=\"" x "\"")
;; 				     ((org-show-following-heading nil)
;; 				      (org-agenda-prefix-format x)))) 
;; 		  '("home" "work"))
;; )))) 

;; Remember mode

;; Key bindings
;; The last three lines define global keys for some 
;; commands — please choose suitable keys yourself.
(global-set-key "\C-cl" 'org-store-link) 
(global-set-key "\C-ca" 'org-agenda) 
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-co" 'my-org)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
