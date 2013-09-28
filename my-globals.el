;; Можно читать info-файл (elisp) Key Binding Conventions, который находтся в
;; ELisp Reference Manual => Programming Tips.

;; By official emacs documentation (info "Key Binding
;; Conventions") , the key space for users are the function
;; keys F5 to F9, and [Ctrl+c letter]. This is very
;; restrictive.

;; Some recomendations from 
;; http://ergoemacs.org/emacs/keyboard_shortcuts.html

;; F5, F6, F7, F8, F9, F11, F12
; Excellent

;; F1, F2, F3, F4, F10 
; Good if you don't use their defaults actions.

;; <Ctrl+F1> to ?Ctrl+F12?       
; Excellent

;; ?Alt+F1? to ?Alt+F12?         
; Excellent

;; ?? Shift+F1? to ?? Shift+F12? 
; Excellent

;; ?Ctrl+0? to ?Ctrl+9?, ?Alt+0? to ?Alt+9?
; Good. By default, they call digit-argument, which is not
; often used.

;; Keys on number pad, with or without a modifier    
; Very useful, but depending on which emacs distro/OS you
; are using, or terminal vs GUI, binding these keys may not
; work. Same thing can be said for those Insert, Delete,
; Home, End, Page Up, Page Down keys.

;; Hyper or Super                
; Any combination with these is good. You can set them to ?
; Win or ? Menu or ? Opt. ?? How to Define Super ? Hyper
; Keys?

(global-set-key (kbd "C-c l") 'linum-mode)
(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "C-c t") 'untabify)
(global-set-key (kbd "C-c T") 'tabify)
(global-set-key (kbd "C-c r") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c q") 'toggle-truncate-lines)
(global-set-key (kbd "C-c f") 'fci-mode)

(global-set-key (kbd "C-c s r") 'my-flyspell-russian)
(global-set-key (kbd "C-c s e") 'my-flyspell-english)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; ibuffer by default
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;; word-stepping
(global-set-key (kbd "C-<right>") 'my-forward-same-syntax)
(global-set-key (kbd "C-<left>") 'my-backward-same-syntax)

;; backward-kill
(global-set-key [\C-backspace] 'backward-kill-word)

;; windows resizing
;(global-set-key [C-M-down] 'win-resize-minimize-horiz)
;(global-set-key [C-M-up] 'win-resize-enlarge-horiz)
;(global-set-key [C-M-left] 'win-resize-enlarge-vert)
;(global-set-key [C-M-right] 'win-resize-minimize-vert)

;; Meta + arrows for moving across the windows
;(windmove-default-keybindings 'meta)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-c g") 'magit-status)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Working with bookmarks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(global-set-key [f5] 'bookmark-set)
;(global-set-key [f6] 'bookmark-jump)
;(global-set-key [C-f6] 'bookmark-jump-other-window)
;(global-set-key [f7] 'bookmark-bmenu-list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hot key for view buffer size
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(global-set-key [\C-f8] '(buffer-size nil))
;(global-set-key [C-f5] 'compile)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(global-set-key "\C-cl" 'org-store-link) 
;(global-set-key "\C-ca" 'org-agenda) 
;(global-set-key "\C-cb" 'org-iswitchb)
;(global-set-key "\C-co" 'my-org)


