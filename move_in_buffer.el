
;; shortcut
(global-set-key "\M-n"  'forward-paragraph)
(global-set-key "\M-p"  'backward-paragraph)

;; book-mark-jump 重绑为像ido一样
(global-set-key (kbd "C-x r b") 'my-bookmark-jump)

;; 在括号上时%跳到匹配的括号
;; (global-set-key "%" 'match-paren)

;;作记号,作完记号可以马上跳回来
(global-set-key (kbd "C-=") 'ska-point-to-register)
(global-set-key (kbd "C--") 'ska-jump-to-register)