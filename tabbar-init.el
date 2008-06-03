(require 'tabbar)
(tabbar-mode)
(global-set-key (quote [C-S-down]) 'tabbar-backward-group)
(global-set-key (quote [C-S-up]) 'tabbar-forward-group)
(global-set-key (quote [C-S-left]) 'tabbar-backward)
(global-set-key (quote [C-S-right]) 'tabbar-forward)

;; Setup for buffer switch
;;(global-set-key "\C-x\C-b" 'bs-show)    ;; or another key

(global-set-key (quote [S-iso-lefttab]) 'bs-cycle-previous)
;; (global-set-key [(control tab)]       'bs-cycle-next)
(global-set-key [(control tab)]       'ido-switch-buffer)

;; (global-set-key "\M-p"  'bs-cycle-previous)
;; (global-set-key "\M-n"  'bs-cycle-next)
(global-set-key "\M-s"  'ecb-toggle-ecb-windows)
