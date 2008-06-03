;;(set-default-font "-adobe-courier-bold-r-normal--24-240-75-75-m-150-iso10646-1" )

;; (set-default-font "-adobe-courier-bold-r-normal--20-140-100-100-m-110-iso10646-1" )

;;; (set-default-font "-wenquanyi-wenquanyi bitmap song-medium-r-normal--13-130-75-75-p-80-iso10646-1" )

;;(set-default-font "-wenquanyi-wenquanyi bitmap song-medium-r-normal--16-160-75-75-p-80-iso10646-1" )
;;disable welcome screen
(create-fontset-from-fontset-spec
  "-adobe-courier-medium-r-*-*-18-*-*-*-*-*-fontset-ifree,
  chinese-gb2312:-wenquanyi-wenquanyi bitmap song-medium-r-normal--16-160-75-75-p-80-iso10646-1,
  chinese-big5-1:-wenquanyi-wenquanyi bitmap song-medium-r-normal--16-160-75-75-p-80-iso10646-1,
  chinese-big5-2:-wenquanyi-wenquanyi bitmap song-medium-r-normal--16-160-75-75-p-80-iso10646-1,
  chinese-sisheng:-wenquanyi-wenquanyi bitmap song-medium-r-normal--16-160-75-75-p-80-iso10646-1,
  chinese-cns11643-3:-wenquanyi-wenquanyi bitmap song-medium-r-normal--16-160-75-75-p-80-iso10646-1,
  chinese-cns11643-4:-wenquanyi-wenquanyi bitmap song-medium-r-normal--16-160-75-75-p-80-iso10646-1,
  chinese-cns11643-5:-wenquanyi-wenquanyi bitmap song-medium-r-normal--16-160-75-75-p-80-iso10646-1,
  chinese-cns11643-6:-wenquanyi-wenquanyi bitmap song-medium-r-normal--16-160-75-75-p-80-iso10646-1,
  chinese-cns11643-7:-wenquanyi-wenquanyi bitmap song-medium-r-normal--16-160-75-75-p-80-iso10646-1,
  "
)

(set-default-font "fontset-ifree")

(setq inhibit-startup-message t)
(setq truncate-partial-width-windows nil)


(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; set color

(require 'color-theme)
(color-theme-initialize)
;;(color-theme-gnome2)
;;(color-theme-dark-blue)
(color-theme-dark-laptop)
;; disbear toolbar
(tool-bar-mode nil)
;; disapear menu
(menu-bar-mode nil)

(scroll-bar-mode nil)

(linum-mode)

;;(global-set-key (kbd "F10") 'menu-bar-mode)
(global-set-key [f10] 'menu-bar-mode)
;;WIN+s Shell
(global-set-key (kbd "s-s") 'shell)