;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  一些散的设置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 散设置的显示部分
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;默认的主模式
(setq default-major-mode 'text-mode)
;; 高亮显示当前行
;; (global-hl-line-mode t)

;; 在屏幕边缘 3 行时就滚动
(setq scroll-margin 3
      scroll-conservatively 10000)


;;打开ido支持,这个模式在查找文件的时候很有用
(require 'ido)
(ido-mode t)

;;for kill-ring
(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; for session
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

(setq default-directory "~/work/")

(require 'desktop)
(desktop-load-default)
;; (desktop-read)
(desktop-save-mode 1)

;; 图片查看工具
;;(require 'thumbs)

