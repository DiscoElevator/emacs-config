;;;;;;;;;;;;;;
;; Packages ;;
;;;;;;;;;;;;;;
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa.org" . "http://melpa.org/packages/"))

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

;;;;;;;;;;
;; Helm ;;
;;;;;;;;;;
(require 'helm-config)

(setq helm-split-window-in-side-p t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source t) ; move to end or beginning of source when reaching top or bottom of source.

                                        ;(defalias 'helm-buffer-match-major-mode 'helm-buffers-match-function)

(helm-mode 1)
                                        ;(setq helm-M-x-fuzzy-match t)

;;;;;;;;;;;;;;
;; js2-mode ;;
;;;;;;;;;;;;;;
;; (add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))


;;;;;;;;;;;;;;;;
;; projectile ;;
;;;;;;;;;;;;;;;;
(require 'projectile)
(require 'helm-projectile)
(helm-projectile-on)
(projectile-global-mode)
(setq projectile-generic-command "gfind . -type f -print0")
;; (setq projectile-indexing-method 'alien)
(setq projectile-indexing-method 'native)

;;;;;;;;;;;;;;;
;; yasnippet ;;
;;;;;;;;;;;;;;;
(require 'yasnippet)
(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;
;; expand-region ;;
;;;;;;;;;;;;;;;;;;;
(require 'expand-region)

;;;;;;;;;;;;;;
;; web-mode ;;
;;;;;;;;;;;;;;
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
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

;;;;;;;;;;;;;;
;; ace-jump ;;
;;;;;;;;;;;;;;
(require 'ace-jump-mode)

;;;;;;;;;;;;;
;; diff-hl ;;
;;;;;;;;;;;;;
(require 'diff-hl)
(global-diff-hl-mode)
