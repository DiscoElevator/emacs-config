;;;;;;;;;;;;;;
;; Encoding ;;
;;;;;;;;;;;;;;
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(set-locale-environment "en.UTF-8")
(prefer-coding-system 'utf-8-unix)
(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding

;;;;;;;;;;
;; Save ;;
;;;;;;;;;;
(setq make-backup-files nil) ;; Don't want any backup files
(setq auto-save-list-file-name nil) ;; Don't want any .saves files
(setq auto-save-default nil) ;; Don't want any auto saving

(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;;;;;;;;;
;; Alert ;;
;;;;;;;;;;;
(setq visible-bell 1)

(setq mouse-drag-copy-region nil)

;;;;;;;;;;;;
;; indent ;;
;;;;;;;;;;;;
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(setq-default tab-always-indent nil) ; make tab key call indent command or insert tab character, depending on cursor position
(setq-default nxml-child-indent 4)
(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode t)))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 2)))