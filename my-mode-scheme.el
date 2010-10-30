;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Scheme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;-- my
(setq my-plt-home-win "C:/Program Files (x86)/Racket/")
(setq my-plt-home-mac "")

(setq my-plt-home (if (eq system-type `windows-nt)
		      my-plt-home-win my-plt-home-mac))

;;-- scheme mode and quack
(require 'quack)
(setq scheme-program-name "mzscheme")
(add-to-list 'quack-pltcollect-dirs (concat my-plt-home "doc/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
