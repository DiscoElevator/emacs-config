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