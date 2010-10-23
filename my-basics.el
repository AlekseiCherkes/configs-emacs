;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Базовые настройки (не требуют установки дополнительных пкетов)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Корректная работа с UTF-8 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-language-environment "UTF-8")

;(setq file-name-coding-system 'utf-8)

(setq file-coding-system-alist '(("" . utf-8) ))
(setq process-coding-system-alist '(("" . utf-8) ))
(setq network-coding-system-alist '(("" . utf-8) ))
(setq gnus-group-charset-alist '((".*" utf-8)))

(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-language-environment-coding-systems 'utf-8)

(prefer-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

; Нужно для корректной вставки русских букв из других программ 
; через буффер обмена. Как работает не знаю.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EFFECTIVE EMACS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Убираем все ненужное с экрана
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

; Не помню зачем
(put 'scroll-left 'disabled nil)

;; Отвечаем y/n вместо yes/no.
(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-xm" 'execute-extended-command)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shell customization.
;; M-x shell -- вызовы внешнего shell
;; M-x eshell -- реализация shell с помощью ELisp.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; For cygwin (on windows).

; It is the variable that controls which
; shell Emacs uses when it wants to run a 
; shell command.

(setq shell-file-name  "bash")

; It is the variable that controls which 
; shell M-x shell starts up.

(setq explicit-shell-file-name "bash")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Перемещение между окнами с помощью Alt + Up/Down/Left/Right
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'windmove)
(windmove-default-keybindings 'meta)

(setq win-step 10)

(defun win-resize-top-or-bot ()
  "Figure out if the current window is on top, bottom or in the middle"
  (let* ((win-edges (window-edges))
	 (this-window-y-min (nth 1 win-edges))
	 (this-window-y-max (nth 3 win-edges))
	 (fr-height (frame-height)))
    (cond
     ((eq 0 this-window-y-min) "top")
     ((eq (- fr-height 1) this-window-y-max) "bot")
     (t "mid"))))

(defun win-resize-left-or-right ()
  "Figure out if the current window is to the left, right or in the middle"
  (let* ((win-edges (window-edges))
	 (this-window-x-min (nth 0 win-edges))
	 (this-window-x-max (nth 2 win-edges))
	 (fr-width (frame-width)))
    (cond
     ((eq 0 this-window-x-min) "left")
     ((eq (+ fr-width 4) this-window-x-max) "right")
     (t "mid"))))

(defun win-resize-enlarge-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window (- win-step)))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window (+ win-step)))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window (- win-step)))
   (t (message "nil"))))

(defun win-resize-minimize-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window (+ win-step)))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window (- win-step)))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window (+ win-step)))
   (t (message "nil"))))

(defun win-resize-enlarge-vert ()
  (interactive)
  (cond
   ((equal "left"  (win-resize-left-or-right)) (enlarge-window-horizontally (+ win-step)))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally (- win-step)))
   ((equal "mid"   (win-resize-left-or-right)) (enlarge-window-horizontally (+ win-step)))
   ))

(defun win-resize-minimize-vert ()
  (interactive)
  (cond
   ((equal "left"  (win-resize-left-or-right)) (enlarge-window-horizontally (- win-step)))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally (+ win-step)))
   ((equal "mid"   (win-resize-left-or-right)) (enlarge-window-horizontally (- win-step)))
   ))

(global-set-key [C-M-down] 'win-resize-minimize-horiz)
(global-set-key [C-M-up] 'win-resize-enlarge-horiz)
(global-set-key [C-M-left] 'win-resize-minimize-vert)
(global-set-key [C-M-right] 'win-resize-enlarge-vert)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Working with bookmarks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key [f5] 'bookmark-set)
(global-set-key [f6] 'bookmark-jump)
(global-set-key [C-f6] 'bookmark-jump-other-window)
(global-set-key [f7] 'bookmark-bmenu-list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Working with desktops
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Other
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-windows-related ()
  (cua-mode))

(defun my-macos-related ()
  (tabbar-mode -1)		       ; no tabbar
  (one-buffer-one-frame-mode -1)       ; no one-buffer-per-frame
  (setq special-display-regexps nil)   ; do not open certain buffers in special windows/frames
  )

(if (eq system-type `windows-nt)
    (my-windows-related)
    (my-macos-related))

; IBuffer by default
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

; Other stuff
(setq tab-width 4)
(setq transient-mark-mode t)
(setq current-language-environment "UTF-8")
(setq c-basic-offset 4)
(setq show-trailing-whitespace t) 

; Hot key for view buffer size
;(global-set-key [\C-f8] '(buffer-size nil))

; Подсветка строки на которой находится курсор
; (highlight-current-line-on t)
; (highlight-current-line-whole-line-on t)
; (highlight-current-line-set-bg-color "grey25")

;; Make backups go to a backup directory
(add-to-list 'backup-directory-alist 
	     '("." . "~/.emacs_backups"))

; Показываем время.
;(setq display-time-interval 1)
;(setq display-time-format "%H:%M:%S")
;(display-time-mode)

; Переключалка буфферов
(iswitchb-mode 1)
;(ido-mode 1)

;; Можно сохранять сессию перед выходом.
;(desktop-save-mode t)

;;(desktop-save-mode t)

(global-set-key [\C-backspace] 'backward-kill-word)

(global-set-key [C-f5] 'compile)

;; Lines wrap
(setq default-truncate-lines t) ;; disable line wrap
(setq truncate-partial-width-windows nil) ;; make side by side buffers function the same as the main window
(global-set-key [f12] 'toggle-truncate-lines) ;; Add F12 to toggle line wrap

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Calendar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; `american' - month/day/year
;; `european' - day/month/year
;; `iso'      - year/month/day

;(calendar-set-date-style `iso)
(setq calendar-week-start-day 1
      calendar-day-name-array
      ["Воскресенье" "Понедельник" "Вторник" "Среда"
       "Четверг" "Пятница" "Суббота"]
      calendar-month-name-array
      ["Январь" "Февраль" "Март" "Апрель" "Май" 
       "Июнь" "Июль" "Август" "Сентябрь"
       "Октябрь" "Ноябрь" " Декабрь"]
      calendar-day-abbrev-array
      ["Вс" "Пн" "Вт" "Ср" "Чт" "Пт" "Сб"])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dired mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Hide files I don't want to see, 
;; such as .fxo, backups and autosave files.
;;
;; M-o -- toggle ommit mode 

(require 'dired-x)

(add-to-list 'dired-omit-extensions ".fxo")
(add-hook 'dired-mode-hook 
	  (lambda () (dired-omit-mode 1)) 
	  't) ;; APPEND


;; Ключи для комманды ls.
;; -l -- вывод в виде списка (обязтельна)
;; -a -- скрытые файлы
;; -A -- все файлы кроме . и .. (включено для суперюзуров по умолчанию)
;; -h -- размер с суффиксами B, K, M, G, T
(setq dired-listing-switches "-Al")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Autorevert mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-auto-revert-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FONTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(require 'zoom-frm')

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
