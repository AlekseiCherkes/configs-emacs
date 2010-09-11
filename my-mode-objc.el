;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Objective-C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; objc-mode for *.m and *.mm files

(setq auto-mode-alist (cons '("\\.m$" . objc-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mm$" . objc-mode) auto-mode-alist))

; I use the following function from the "find-file-hook" in order
; to choose between using objc-mode, c++-mode and c-mode 
; when opening a ".h" file.
;
; http://www.bretthutley.com/emacs/integrating-emacs-and-xcode/

(defun my-choose-header-mode ()
  (interactive)
  (if (string-equal (substring (buffer-file-name) -2) ".h")
      (progn
        ;; OK, we got a .h file, if a .m file exists we'll assume it's
        ; an objective c file. Otherwise, we'll look for a .cpp file.
        (let ((dot-m-file (concat (substring (buffer-file-name) 0 -1) "m"))
              (dot-cpp-file (concat (substring (buffer-file-name) 0 -1) "cpp")))
          (if (file-exists-p dot-m-file)
              (progn (objc-mode))
            (if (file-exists-p dot-cpp-file)
                (c++-mode)))))))
 
(add-hook 'find-file-hook 'my-choose-header-mode)

; Finally you can compile using xcodebuild with the following code.

;; (defun my-objc-compile ()
;;   (interactive)
;;   (let ((df (directory-files "."))
;;         (has-proj-file nil))
;;     (while (and df (not has-proj-file))
;;       (let ((fn (car df)))
;;         (if (> (length fn) 10)
;;             (if (string-equal (substring fn -10) ".xcodeproj")
;;                 (setq has-proj-file t))))
;;       (setq df (cdr df)))
;;     (if has-proj-file
;;         (compile "xcodebuild -configuration Debug")
;;       (compile "make"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
