;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INIT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq my-emacs-dir "~/.emacs.d/")
(add-to-list `load-path my-emacs-dir)

; modules
(load "my-package.el")
(load "my-basics.el")
(load "my-logtailng.el")
(load "my-magit.el")

; modes
(load "my-mode-c.el")
(load "my-mode-haskell.el")
(load "my-mode-cmake.el")
(load "my-mode-python.el")
(load "my-mode-slime.el")
(load "my-mode-scheme.el")
(load "my-mode-org.el")
(load "my-mode-auctex.el")

; global key bindings
(load "my-globals.el")

; load machine depandant file if exists
(setq my-machine-file-name "~/.emacs.d/my-machine-dependant.el")
(if (file-exists-p my-machine-file-name)
	(progn (find-file my-machine-file-name) (load my-machine-file-name))
  (message "No machine dependant file where found."))

; load paths that are the same on all machines
(dired "~/.emacs.d")
(dired "~/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
