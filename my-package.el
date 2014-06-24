;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

(add-to-list 'package-archives
			 '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'package-archives
			 '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Check installed packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)

(defvar my-packages '(org auctex magit cmake-mode haskell-mode
					  quack auto-complete fill-column-indicator
					  yasnippet exec-path-from-shell auctex
					  projectile expand-region markdown-mode yaml-mode dsvn)
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return 't)))

(defun my-packages-list-not-installed ()
  (loop for p in my-packages
        when (not (package-installed-p p)) 
		do (message "The package: " p " is not installed")
		finally (return nil)))

;; Call it manually when package installation is needed
;; TODO(a_cherkes): something is not working
(defun my-packages-install ()
  (interactive)
  (unless (my-packages-installed-p)
	;; check for new packages (package versions)
	(package-refresh-contents)
	;; install the missing packages
	(dolist (p my-packages)
	  (when (not (package-installed-p p))
		(package-install p)))))

(unless (my-packages-installed-p)
  (message "You need to install some packages."))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
