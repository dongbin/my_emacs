;; for yaml

(require 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(require 'sass-mode)

(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))


(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; for javascript

(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '( "\\.js\\'" . javascript-mode))

;; for gnuplot
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

(add-hook 'nxml-mode-hook
          (lambda ()
            (setq local-abbrev-table nxml-mode-abbrev-table)))
;;(autoload 'ruby-mode "ruby-mode" "Ruby editing mode." t)
(setq auto-mode-alist  (cons '("\\.rjs$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.rsel$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.autotest$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.xml$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.xsd$" . nxml-mode) auto-mode-alist))

(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))
