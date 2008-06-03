
(global-set-key "\M-q" 'kill-this-buffer)
(global-set-key (kbd "C-<tab>") 'ido-switch-buffer)
;; (global-set-key "\C-x\C-b" 'electric-buffer-list)
;;for ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; C-x C-b 缺省的绑定很不好用，改成一个比较方便的 electric-buffer-list，执行
;; 之后：
;;     光标自动转到 Buffer List buffer 中；
;;     n, p   上下移动选择 buffer；
;;     S      保存改动的 buffer；
;;     D      删除 buffer。
;; 除此之外，不错的选择还有 ibuffer，不妨试试 M-x ibuffer。
;; ido模式的C-x k不好用
(global-set-key (kbd "C-x k") 'kill-this-buffer)


(setq enable-recursive-minibuffers t);递归使用minibuffer


;;在minibuffer中启用部分补全功能
(partial-completion-mode t)
;;在minibuffer里启用自动补全函数和变量
(icomplete-mode 1)

;; 不要问 yes-or-no，只问 y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)