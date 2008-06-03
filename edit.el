
;;使用C-k删掉指针到改行末的所有东西
(setq-default kill-whole-line t)
;; 交换这两个按键。因为大多数情况下，回车后是要缩进的。
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)
;; 移动行的操作，件utils.el
;; 把M-z设成一个前缀吧 把zap-to-char绑到M-z z上面就行了
(define-prefix-command 'M-z-map)
(global-set-key (kbd "M-z") 'M-z-map)

;; 跳到某个字符
;; (define-key global-map (kbd "M-z a") 'my-go-to-char)
(global-set-key (kbd "M-z a") 'my-go-to-char)

(define-prefix-command 'M-z-l-map)
(global-set-key (kbd "M-z l") 'M-z-l-map)

(global-set-key (kbd "M-z z") 'zap-to-char)

(global-set-key   (kbd "M-z l j") 'my-move-line-down)
(global-set-key   (kbd "M-z l k") 'my-move-line-up)
(global-set-key   (kbd "M-z l m") 'my-dup-line-down)
(global-set-key   (kbd "M-z l s") 'ue-select-line-down-continued)
