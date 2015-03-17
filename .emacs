(set-language-environment "UTF-8")

(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "us") ; US
(load-file "~/.emacs.d/ergoemacs/site-lisp/site-start.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(delete-selection-mode t)
 '(helm-mode t)
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys nil)
 '(recentf-mode t)
 '(shift-select-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 128 :width normal))))
 '(completions-common-part ((t (:inherit default :foreground "red"))))
 '(show-paren-match ((((class color) (background light)) (:background "azure2")))))

(setq show-paren-style 'expression)
(show-paren-mode 2)

(setq make-backup-files nil) ;; Don't want any backup files
(setq auto-save-list-file-name nil) ;; Don't want any .saves files
(setq auto-save-default nil) ;; Don't want any auto saving

;; disable sound alert
(setq visible-bell 1)

;; word wrap off
(global-visual-line-mode 1)

;; Color Theme
(add-to-list 'load-path "~/.emacs.d/color-theme/")
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-molokai)

;; Font
(set-frame-font "Courier New-13")

(require 'package)
(package-initialize)

;; elpa package list installation
(defun update-packages ()
   (setq jpk-packages
      '(
        helm
        js2-mode
        ))

  (package-initialize)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.org/packages/"))
  (add-to-list 'package-archives
	       '("org" . "http://orgmode.org/elpa/"))

  (when (not package-archive-contents)
    (package-refresh-contents))

  (dolist (pkg jpk-packages)
    (when (and (not (package-installed-p pkg))
	       (assoc pkg package-archive-contents))
      (package-install pkg)))

  (defun package-list-unaccounted-packages ()
    "Like `package-list-packages', but shows only the packages that
  are installed and are not in `jpk-packages'.  Useful for
  cleaning out unwanted packages."
    (interactive)
    (package-show-package-list
     (remove-if-not (lambda (x) (and (not (memq x jpk-packages))
				     (not (package-built-in-p x))
				     (package-installed-p x)))
		    (mapcar 'car package-archive-contents))))

)

;; Helm
(require 'helm-config)

(setq helm-split-window-in-side-p t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source t) ; move to end or beginning of source when reaching top or bottom of source.

(helm-mode 1)

;; indent
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(setq-default tab-always-indent nil) ; make tab key call indent command or insert tab character, depending on cursor position

;; js2-mode
(add-hook 'js-mode-hook 'js2-minor-mode)

;; KEY BINDINGS
(global-set-key (kbd "C-g") 'goto-line)
(global-set-key (kbd "M-a") 'helm-M-x)
