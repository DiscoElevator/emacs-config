;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; file paths autocomplete ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-expand-file-name-at-point ()
  "Use hippie-expand to expand the filename"
  (interactive)
  (let ((hippie-expand-try-functions-list '(try-complete-file-name-partially try-complete-file-name)))
    (call-interactively 'hippie-expand)))


;;;;;;;;;;;;;;;;;;;;;;;;;
;; Web-mode components ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;
;; Comments ;;
;;;;;;;;;;;;;;
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