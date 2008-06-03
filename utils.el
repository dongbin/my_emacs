(defun tabbar-buffer-ignore-groups (buffer)
"Return the list of group names BUFFER belongs to.
Return only one group for each buffer."
(with-current-buffer (get-buffer buffer)
(cond
((or (get-buffer-process (current-buffer))
(memq major-mode
'(comint-mode compilation-mode)))
'("Process")
)
((member (buffer-name)
'("*scratch*" "*Messages*"))
'("Common")
)
((eq major-mode 'dired-mode)
'("Dired")
)
((memq major-mode
'(help-mode apropos-mode Info-mode Man-mode))
'("Help")
)
((memq major-mode
'(rmail-mode
rmail-edit-mode vm-summary-mode vm-mode mail-mode
mh-letter-mode mh-show-mode mh-folder-mode
gnus-summary-mode message-mode gnus-group-mode
gnus-article-mode score-mode gnus-browse-killed-mode))
'("Mail")
)
(t
(list
"Common" ;; no-grouping
(if (and (stringp mode-name) (string-match "[^ ]" mode-name))
mode-name
(symbol-name major-mode)))
)
)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      这一段放一些需要定义的函数，方便的小功能操作
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;关于括号匹配，在括号上按%则光标回到匹配的括号上
;(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;;作记号,作完记号可以马上跳回来
;(global-set-key (kbd "C-=") 'ska-point-to-register)
;(global-set-key (kbd "C--") 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))

;;goto char on the line
;(define-key global-map (kbd "C-c a") 'my-go-to-char) this one obsoleted
;; (global-set-key (kbd "M-z a") 'my-go-to-char)
(defun my-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `my-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

;; 移动行的操作
(global-set-key   (kbd "M-z l j") 'my-move-line-down)
(global-set-key   (kbd "M-z l k") 'my-move-line-up)
(global-set-key   (kbd "M-z l m") 'my-dup-line-down)
(global-set-key   (kbd "M-z l s") 'ue-select-line-down-continued)

(defun my-move-line-up (p)                  ;;向上移动本行
  "move current line up"
  (interactive "p")
  (let ((c (current-column)))
    (beginning-of-line)
    (kill-line 1)
    (previous-line p)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))

(defun my-move-line-down (p)                ;;向下移动本行
  "move current line down"
  (interactive "p")
  (let ((c (current-column)))
    (beginning-of-line)
    (kill-line 1)
    (next-line p)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))

(defun my-dup-line-down ()                  ;;复制本行到下一行
  "duplicate this line at next line"
  (interactive)
  (let ((c (current-column)))
    (beginning-of-line)
    (ue-select-line-down)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))

(defvar ue-selection-last-point nil
  "Indicates whether to kill-append or kill-new")
(defvar ue-selection-total-lines 0
  "Total number of lines appended so far to the last item in kill-ring")

(defun ue-selection-update-cont ()
  "Update `ue-selection-last-point' variable"
  (if (and this-command
           (string= (format "%s" this-command)
                    "ue-select-line-down-continued"))
      (setq ue-selection-last-point (point))
    (setq ue-selection-total-lines 0)
    (setq ue-selection-last-point  nil)))

(add-hook 'post-command-hook 'ue-selection-update-cont)

(defun ue-select-line-down-continued ()     ;;连续复制多行
  "like Shift+down in UltraEdit, but do no selection.
Just put these continuous lines all toghether as a new item in kill-ring.
Messages will appear in minibuffer telling you how many lines were copied.
Continuous commands with no interruption append new lines to the item.
Any non-ue-select-line-down-continued command will stop gathering new lines
and make a new item in kill-ring.

post-command-hook is used in detecting the continuity of this command.
check `ue-selection-update-cont' and `post-command-hook'."
  (interactive)
  (let ((s (point)))
    (setq next-line-add-newlines t)
    (next-line 1)
    (setq next-line-add-newlines nil)
    (if (and ue-selection-last-point
             (= (save-excursion
                  (when (> (count-lines (point-min) (point)) 1)
                    (previous-line 1))
                  (point))
                ue-selection-last-point))
        (progn
          (kill-append (buffer-substring s (point)) nil)
          (setq ue-selection-total-lines (1+ ue-selection-total-lines))
          (message (format "%s lines copied" ue-selection-total-lines)))
      (kill-new (buffer-substring s (point)))
      (message "1 line copied")
      ;; some errors will cause post-command-hook deletion
      ;; so add-hook every time after we add the first line
      (add-hook 'post-command-hook 'ue-selection-update-cont)
      (setq ue-selection-total-lines 1))))

(defun ue-select-line-down ()
  "like Shift+down in UltraEdit."
  (interactive)
  (let ((s (point)))
  (setq next-line-add-newlines t)
  (next-line 1)
  (setq next-line-add-newlines nil)
  (kill-new (buffer-substring s (point)))))
;;comment current line
(defun my-comment-current-line ()
  (interactive)
  (comment-region (line-beginning-position) (line-end-position)))

(defun my-uncomment-current-line ()
  (interactive)
  (uncomment-region (line-beginning-position) (line-end-position)))
;; (global-set-key "\M-;" 'my-comment-current-line)
;; (global-set-key "\M-'" 'my-uncomment-current-line)

(defun my-beginning-of-line ()
  "If the point is not on beginning of current line, move point
to beginning of current line, as 'beginning-of-line' does.
If the point already is on the beginning of current line, then
move the point to the first non-space character, if it exists."
  (interactive)
  (if (not (eq (point) (line-beginning-position)))
      (beginning-of-line)
    (when (re-search-forward "\[^\[:blank:\]　\]" (line-end-position) t)
      (backward-char))
    ))
(global-set-key (kbd "C-a") 'my-beginning-of-line)

;; use term
(defun my-term-bash ()
  "like M-x term RET bash RET"
  (interactive)
  (term (getenv "SHELL")))
;; (global-set-key (kbd "C-c t") 'my-term-bash)

;; auto split window for a term
(defun my-split-for-term ()
  (interactive)
  (split-window-vertically -10)
  (other-window 1)
  (my-term-bash)
  )
;; (global-set-key (kbd "s-c t") 'my-split-for-term)

;; defun bookmark just as ido
(defun my-bookmark-jump (bookmark)
  (interactive
   (progn
     (bookmark-maybe-load-default-file)
     (list (ido-completing-read "Jump to bookmark: "
                                (mapcar 'car bookmark-alist)))))
  (bookmark-jump bookmark))
;; (global-set-key (kbd C-x r b) 'my-bookmark-jump)

;; revise for footnote mode
(defun wiza-rescan-footnote ( )
  (interactive)
  (setq footnote-text-marker-alist nil)
  (setq footnote-pointer-marker-alist nil)
  (let* ((p (point-min)) notes-pos num)
    (save-excursion
      (goto-char (point-min))
      (setq notes-pos (search-forward-regexp "^Footnotes: $" (point-max) t))
      (if notes-pos
          (progn
            (goto-char (point-min))
            (while (and (< (point) notes-pos)  (search-forward-regexp
"\\[\\([0-9]+\\)\\]" notes-pos t))
              (setq footnote-pointer-marker-alist
                    (cons (cons (string-to-number (match-string 1)) (list
(point-marker)))
                          footnote-pointer-marker-alist))
              )
            (setq footnote-pointer-marker-alist (Footnote-sort
footnote-pointer-marker-alist))
            (goto-char notes-pos)
            (while (and (< (point) (point-max)) (search-forward-regexp
"^\\[\\([0-9]+\\)\\]" (point-max) t))
              (setq num (string-to-number (match-string 1)))
              (search-backward "[" notes-pos t)
              (setq footnote-text-marker-alist
                    (cons  (cons num (point-marker))
                           footnote-text-marker-alist))
              (search-forward "]" (point-max) t)
              )
            (setq footnote-text-marker-alist (Footnote-sort
footnote-text-marker-alist))
            )))
    )
  )
(add-hook 'footnote-mode-hook 'wiza-rescan-footnote)

