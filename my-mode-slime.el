;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Slime
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(my-add-site-lisp "slime/")

; This variable holds a list of programs and if you invoke SLIME
; with a negative prefix argument, M-- M-x slime, you can select
; a program from that list. When called without a prefix, either
; the name specified in slime-default-lisp, or the first item of
; the list will be used. The elements of the list should look 
; like 

;;(setq slime-lisp-implementations
;;      '((sbcl ("sbcl"))
;;	(clisp ("clisp -ansi -q -K full") :coding-system utf-8-unix)))

; Не использую, т.е есть более расширенна версия 
; (slime-lisp-implementations)
;(setq inferior-lisp-program "sbcl") ; your Lisp system

;;(require 'slime)
;;(slime-setup) ; (slime-setup '(slime-fancy))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
