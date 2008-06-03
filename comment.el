(defun my-comment-current-line ()
  (interactive)
  (comment-region (line-beginning-position) (line-end-position)))

(defun my-uncomment-current-line ()
  (interactive)
  (uncomment-region (line-beginning-position) (line-end-position)))

;; for comments

(global-set-key (kbd "M-;") 'my-comment-current-line)
(global-set-key (kbd "M-'") 'my-uncomment-current-line)

(global-set-key (kbd "M-E") 'comment-region)
(global-set-key (kbd "M-U") 'uncomment-region)
