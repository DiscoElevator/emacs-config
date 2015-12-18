;;;;;;;;;;;
;; Paren ;;
;;;;;;;;;;;
(setq show-paren-style 'expression)
;; (setq show-paren-style 'mixed)
(show-paren-mode 2)


;;;;;;;;;;;;;;;;;;;
;; word wrap off ;;
;;;;;;;;;;;;;;;;;;;
(global-visual-line-mode t)
;; (setq-default truncate-lines nil)
(setq default-truncate-lines nil)

;;;;;;;;;;;;;;;;;
;; Color Theme ;;
;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/color-theme/")
(require 'color-theme)
(color-theme-initialize)
(setq-default color-theme-is-global t)
(color-theme-molokai)

;;;;;;;;;;
;; Font ;;
;;;;;;;;;;
(set-frame-font "Courier New-13")
                                        ;(set-frame-font "Consolas-13")
