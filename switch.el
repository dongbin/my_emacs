(setq x-select-enable-clipboard t)

(setq visible-bell t)

(setq make-backup-files nil)

;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。很好玩阿，这个功能

(mouse-avoidance-mode 'animate)

(transient-mark-mode t)
;;不要工具栏
(tool-bar-mode nil)
;;不显示 Emacs 的开始画面。
(setq inhibit-startup-message t)