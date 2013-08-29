;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
		     `("agenda.org" "next.org" "calendar.org" "waiting.org")))

(defun my-org ()
  (interactive)
  (dired org-directory))

(setq org-agenda-custom-commands
      '(("h" "Agenda and Home-related tasks"
	 ((agenda "")
	  (tags "CATEGORY=\"waiting\"")
	  (tags "CATEGORY=\"agenda\"")
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
