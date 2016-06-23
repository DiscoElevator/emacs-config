                                        ;(set-language-environment "UTF-8")
;; Use UTF-8 for all character encoding.
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(set-locale-environment "en.UTF-8")
(prefer-coding-system 'utf-8-unix)
(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding

(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "us") ; US
(load-file "~/.emacs.d/ergoemacs/site-lisp/site-start.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(compilation-read-command nil)
 '(delete-selection-mode t)
 '(global-visual-line-mode t)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "node_modules" "dist" "lib")))
 '(grep-find-ignored-files
   (quote
    (".#*" "*.o" "*~" "*.bin" "*.bak" "*.obj" "*.map" "*.ico" "*.pif" "*.lnk" "*.a" "*.ln" "*.blg" "*.bbl" "*.dll" "*.drv" "*.vxd" "*.386" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "*.jar" "*.exe")))
 '(helm-mode t)
 '(js2-highlight-level 3)
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys nil)
 '(projectile-completion-system (quote helm))
 '(projectile-global-mode t)
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" "node_modules")))
 '(recentf-mode t)
 '(safe-local-variable-values
   (quote
    ((compile-command concat "cd "
                      (projectile-project-root)
                      "ant" " & ant -Dserver.type=TOMCAT"))))
 '(shift-select-mode nil)
 '(tags-table-list nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 128 :width normal))))
 '(completions-common-part ((t (:inherit default :foreground "red"))))
 '(show-paren-match ((((class color) (background light)) (:background "azure2")))))

(setq show-paren-style 'expression)
;; (setq show-paren-style 'mixed)
(show-paren-mode 2)

(setq make-backup-files nil) ;; Don't want any backup files
(setq auto-save-list-file-name nil) ;; Don't want any .saves files
(setq auto-save-default nil) ;; Don't want any auto saving

;; disable sound alert
(setq visible-bell 1)

(setq mouse-drag-copy-region nil)

;; word wrap off
(global-visual-line-mode t)
;; (setq-default truncate-lines nil)
(setq default-truncate-lines nil)

(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq mode-require-final-newline nil)

;; Color Theme
(add-to-list 'load-path "~/.emacs.d/color-theme/")
(require 'color-theme)
(color-theme-initialize)
(setq-default color-theme-is-global t)
(color-theme-molokai)

;; Font
(set-frame-font "Courier New-13")
                                        ;(set-frame-font "Consolas-13")

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '(("gnu" . "http://elpa.gnu.org/packages/"),
               ("melpa.org" . "http://melpa.org/packages/")
               ))

;; elpa package list installation
(defun update-packages ()
  (setq jpk-packages
        '(
          async
          helm
          js2-mode
          projectile
          helm-projectile
          expand-region
          web-mode
          ace-jump-mode
          diff-hl
          less-css-mode
          ;; editorconfig
          ))

  (setq package-archives '(("melpa.org" . "http://melpa.org/packages/")
                           ("gnu" . "http://elpa.gnu.org/packages/")
                                        ;("melpa-stable" . "http://stable.melpa.org/packages/")
                           ))

  (package-initialize)
  ;; (add-to-list 'package-archives
  ;; 	       '("melpa.org" . "http://melpa.org/packages/"))
  ;; (add-to-list 'package-archives
  ;; 	       '("org" . "http://orgmode.org/elpa/"))

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

(update-packages)

;; Helm
(require 'helm-config)

(setq helm-split-window-in-side-p t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source t) ; move to end or beginning of source when reaching top or bottom of source.

                                        ;(defalias 'helm-buffer-match-major-mode 'helm-buffers-match-function)

(helm-mode 1)
                                        ;(setq helm-M-x-fuzzy-match t)

;; indent
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

;; js2-mode
;; (add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; file paths autocomplete
                                        ;(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "C-SPC") 'my-expand-file-name-at-point)
(defun my-expand-file-name-at-point ()
  "Use hippie-expand to expand the filename"
  (interactive)
  (let ((hippie-expand-try-functions-list '(try-complete-file-name-partially try-complete-file-name)))
    (call-interactively 'hippie-expand)))

;; projectile
(require 'projectile)
(require 'helm-projectile)
(helm-projectile-on)
(projectile-global-mode)
(setq projectile-generic-command "gfind . -type f -print0")
;; (setq projectile-indexing-method 'alien)
(setq projectile-indexing-method 'native)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; expand-region
(require 'expand-region)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsp?\\'" . web-mode))
(set-face-attribute 'web-mode-html-tag-face nil :foreground "#e83070")
                                        ;(set-face-attribute 'web-mode-html-tag-face nil :foreground "#e830c0")
(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-css-property))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
(setq web-mode-engines-alist
      '(("ctemplate" . "\\.html\\'")))
(setq web-mode-code-indent-offset 4)
(setq web-mode-markup-indent-offset 4)
(setq web-mode-tag-auto-close-style 2)
(setq web-mode-enable-current-element-highlight t)

(require 'ace-jump-mode)

(require 'diff-hl)
(global-diff-hl-mode)

(setq org-todo-keywords '((type "TODO" "IN PROGRESS" "|" "DONE")))

;; (require 'tern)
;; (tern-mode)
;; (setq tern-command '("tern"))

;;;;;;;;;;;;;;;;;;;;;;
;; Custom functions ;;
;;;;;;;;;;;;;;;;;;;;;;

(defun toggle-narrow-script ()
  (interactive)
  (defvar narrowed nil)
  (if (eq narrowed t)
      (progn
        (my-widen-script)
        (setq narrowed t)
        )
    (progn
      (my-narrow-script)
      (setq narrowed nil)
      )
    )
  )

(defun my-narrow-script ()
  (interactive)
  (web-mode-element-content-select)
  (narrow-to-region (region-beginning) (region-end))
  (js2-mode)
  )

(defun my-widen-script ()
  (interactive)
  (widen)
  (web-mode)
  )

(defun comment-eclipse () ;; TODO multiline comments
  (interactive)
  (let ((start (line-beginning-position))
        (end (line-end-position)))
    (when (or (not transient-mark-mode) (region-active-p))
      (setq start (save-excursion
                    (goto-char (region-beginning))
                    (beginning-of-line)
                    (point))
            end (save-excursion
                  (goto-char (region-end))
                  (end-of-line)
                  (point))))
    (comment-or-uncomment-region start end)))

;;;;;;;;;;;;;;;;;;
;; KEY BINDINGS ;;
;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-g") 'goto-line)
(global-set-key (kbd "M-a") 'helm-M-x)

(global-set-key (kbd "M-;") 'er/expand-region)
(global-set-key (kbd "M-:") 'er/contract-region)

(global-set-key (kbd "C-/") 'comment-eclipse) ; TODO doesn't work :(

(global-set-key (kbd "<F8> n n") 'narrow-to-region)
(global-set-key (kbd "<F8> n w") 'widen)

                                        ;(global-set-key (kbd "<RET>") 'align-newline-and-indent) ; indent prev. line after RET

(global-set-key (kbd "C-p") 'helm-projectile-find-file)

(global-set-key (kbd "C-;") 'ace-jump-mode)

(global-set-key (kbd "C-f") 'helm-occur)