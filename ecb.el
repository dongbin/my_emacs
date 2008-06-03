(require 'cedet)

;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;;To startup quickly
;; Select one of the following
(semantic-load-enable-code-helpers)
 (semantic-load-enable-guady-code-helpers)
 (semantic-load-enable-excessive-code-helpers)

;; Enable this if you develop in semantic, or develop grammars
 (semantic-load-enable-semantic-debugging-helpers)

;;To startup ecb quickly
(require 'ecb-autoloads)
(setq ecb-source-path
      (quote ("~/work/easeproject"
              "~/work/ului"
              "~/work/billing"
              "~/work/provision"
              "~/work/xunbao"
              )))
(setq ecb-tip-of-the-day nil)
;; (setq ecb-layout-name "left14")
(setq ecb-layout-name "left7")

(setq ecb-layout-window-sizes (quote (("left14" (0.2 . 0.8) (0.26 . 0.24)))))
(setq use-speedbar-instead-native-tree-buffer "dir")
(ecb-activate)
