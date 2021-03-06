;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Базовые настройки (не требуют установки дополнительных пкетов)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helpers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; System-type definition
(defun system-is-linux()
    (string-equal system-type "gnu/linux"))

(defun system-is-windows()
    (string-equal system-type "windows-nt"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Server
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Start Emacs as a server on linux
(when (system-is-linux)
    (require 'server)
    (unless (server-running-p)
        (server-start)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
(set-clipboard-coding-system `utf-8)
(set-language-environment-coding-systems 'utf-8)

(prefer-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

; Нужно для корректной вставки русских букв из других программ 
; через буффер обмена. Как работает не знаю.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(setq default-file-name-coding-system
 (if (eq system-type `windows-nt) `cp1251 `utf-8))

;; Делаем возможным переключение на русскую раскладку путем нажатия
;; C-\
(setq default-input-method 'russian-computer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CUA Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cua-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; USEFULL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(server-mode)
(setq visible-bell t)

; Inhibit startup screen
(setq inhibit-startup-message t)

;;(require 'workspaces)
;;(define-key global-map (kbd "C-<tab>") 'workspace-controller)

(show-paren-mode t)

;; Show time and date
(setq display-time-day-and-date nil)
(setq display-time-default-load-average nil)
(setq display-time-24hr-format t)
(display-time-mode t)

;; Run Emacs maximized.
;; Applies both server and clients.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EnvVariables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; На MacOS переменные окружения для GUI 
;; программ не такие как в shell.
;; Данные пакет настраивает пути поиска программ 
;; в emacs в соответсвии с настройками shell.

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DSVN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'vc-svn)

(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Spell checking
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'flyspell)
(require 'ispell)

;; Aspell на MacOS установился по-умолчанию.
;; Поэтому не трогаем.
;(setq ispell-program-name "aspell")

;; (setq my-english-dictionary-data ; English
;; 	  `("english"
;; 		"[a-zA-Z]"
;; 		"[^a-zA-Z]"
;; 		"[']"
;; 		nil
;; 		("-d" "en")
;; 		nil iso-8859-1))

;; (setq my-russian-dictionary-data ; Russian
;; 	  '("russian"
;; 		"[АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯабвгдеёжзийклмнопрстуфхцчшщьыъэюя]"
;; 		"[^АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯабвгдеёжзийклмнопрстуфхцчшщьыъэюя]"
;; 		"[-]"
;; 		nil
;; 		("-C" "-d" "ru")
;; 		nil utf-8))

;; (setq my-default-dictionary-data  ; Default
;; 	  '(nil
;; 		"[A-Za-z]"
;; 		"[^A-Za-z]"
;; 		"[']"
;; 		nil
;; 		("-C")
;; 		nil iso-8859-1))

;; (defun my-flyspell-russian ()
;;   (interactive)
;;   (flyspell-mode t)
;;   (ispell-change-dictionary my-ispell-russian-dictionary)
;;   (flyspell-buffer)
;;   (message "Russian dictionary - Spell Checking completed."))

;; (defun my-flyspell-english ()
;;   (interactive)
;;   (flyspell-mode t)
;;   (ispell-change-dictionary my-ispell-english-dictionary)
;;   (flyspell-buffer)
;;   (message "English dictionary - Spell Checking completed."))

;; (add-hook 'flyspell-mode-hook
;;     '(lambda ()
;; 	   (setq my-ispell-dictionary-alist
;; 			 `(my-english-dictionary-data 
;; 			   my-russian-dictionary-data 
;; 			   my-default-dictionary-data))
;; 	   (setq
;; 		my-ispell-russian-dictionary "russian"
;; 		my-ispell-english-dictionary "english"
;; 		flyspell-default-dictionary my-ispell-russian-dictionary
;; 		ispell-dictionary my-ispell-english-dictionary
;; 		ispell-local-dictionary my-ispell-russian-dictionary
;; 		ispell-extra-args '("--sug-mode=ultra"))
;; 	   t))

(defun my-flyspell-english ()
  (interactive)
  (flyspell-mode t)
  (ispell-change-dictionary "en")
  (flyspell-buffer)
  (message "English dictionary - Spell Checking completed."))

(defun my-flyspell-russian ()
  (interactive)
  (flyspell-mode t)
  (ispell-change-dictionary "ru")
  (flyspell-buffer)
  (message "Russian dictionary - Spell Checking completed."))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YAML
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TRAMP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'tramp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YaSnippets
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'yasnippet)
(yas-global-mode 1)

;; "~/.emacs.d/snippets" is already on the "~/.emacs.d/snippets"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Projectile
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; It was С-с p by default, but I want to change that.
;;(setq projectile-keymap-prefix (kbd "C-c C-p"))

;;(require 'projectile)
;;(projectile-global-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Expand-region
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'expand-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Show line and column numbers in all buffers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(line-number-mode 1)
(column-number-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Word stepping
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-forward-same-syntax ()
  (interactive)
  (if (eq (char-syntax (char-after (point)))
		  (char-syntax (char-after (+ (point) 1))))
	  (skip-syntax-forward (char-to-string (char-syntax (char-after))))
	(forward-char)))

(defun my-backward-same-syntax ()
  (interactive)
  (if (eq (char-syntax (char-before (point)))
		  (char-syntax (char-before (- (point) 1))))
	  (skip-syntax-backward (char-to-string (char-syntax (char-before))))
	(backward-char)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smoth scrolling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq mouse-wheel-scroll-amount '(3 ((shift) . 10))) ;; one line at a time
(setq mouse-wheel-progressive-speed 't) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq scroll-conservatively 10000) ;; Что-то про передвижение экрана, когда курсор не видим на нем.
(setq auto-window-vscroll nil)
(setq scroll-margin 5) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы  

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Working with desktops
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq desktop-save `ask) ;; Всегда спрашивать о сохранении сесии.
(desktop-save-mode 0)   ;; Отключить сохранение сесии по умолчнию.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Other
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-windows-related ()
  ;(cua-mode)
)

(defun my-macos-related ()
  ;(tabbar-mode -1)		       ; no tabbar
  ;(one-buffer-one-frame-mode -1)      ; no one-buffer-per-frame
  ;(setq special-display-regexps nil)  ; do not open certain buffers in special windows/frames
  )

(if (eq system-type `windows-nt)
    (my-windows-related)
    (my-macos-related))

; Other stuff
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
;;(setq-default show-trailing-whitespace t)
(setq current-language-environment "UTF-8")
(delete-selection-mode t) ;; Удалять выделенный регион при вводе нового текста.

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
(ido-mode t)

;; Можно сохранять сессию перед выходом.
;(desktop-save-mode t)

;;(desktop-save-mode t)

;; Lines wrap
(setq default-truncate-lines t) ;; disable line wrap
(setq truncate-partial-width-windows nil) ;; make side by side buffers function the same as the main window

;; Display the name of the current buffer in the title bar
(setq frame-title-format "GNU Emacs: %b")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Autocompletion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; Add yasnippet to default ac-sources.
;; See the code of auto-complete-config for more detauils. 
(setq-default ac-sources (append '(ac-source-yasnippet) ac-sources))

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

;; Add .fxo and hidden (dot) files to ommit mode.
(add-to-list 'dired-omit-extensions ".fxo")
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

(add-hook 'dired-mode-hook 
	  (lambda () (dired-omit-mode 1)) 
	  't) ;; APPEND

;; Ключи для комманды ls.
;; -l -- вывод в виде списка (обязтельна)
;; -a -- скрытые файлы
;; -A -- все файлы кроме . и .. (включено для суперюзуров по умолчанию)
;; -h -- размер с суффиксами B, K, M, G, T
(setq dired-listing-switches "-AXlh --group-directories-first")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Autorevert mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-auto-revert-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FONTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(require 'zoom-frm')

;;;;;;;q;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Темы можно посмотреть тут: 
;; http://emacsthemes.caisah.info/
;; http://gnuemacscolorthemetest.googlecode.com/svn/html/index-el.html
;; 
;; В emacs 24 появлился собственные механизм измения 
;; цветовых схем. Внешние пакеты наподобие 'color-theme 
;; устарели.

(load-theme 'wombat t)

;;;;;;;q;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helper functions (for my-machine-dependant.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-dired-if-exists (dir)
  (if (file-exists-p dir)
	  (dired dir)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
