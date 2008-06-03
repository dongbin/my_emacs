(require 'rdoc-mode)
(setq auto-mode-alist  (cons '("\\README$" . rdoc-mode) auto-mode-alist))


(require 'snippet)
(require 'find-recursive)
(require 'rails)

(add-hook 'ruby-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (imenu-add-to-menubar "IMENU")
            (require 'ruby-electric)
            (ruby-electric-mode t)
            (local-set-key "\t" 'hippie-expand)

            ;; for autotest
            (define-key ruby-mode-map (kbd "C-c C-a") 'autotest-switch)
            (define-key ruby-mode-map (kbd "C-c y") 'toggle-buffer)
            ))

;; for autotest

(require 'autotest)

(autoload 'autotest-switch "autotest" "doco" t)
(autoload 'autotest "autotest" "doco" t)

(require 'toggle)
;; (toggle-style "rspec")
;; disable new line syntax check
(global-set-key "\C-r"  'toggle-buffer)

(setq flymake-start-syntax-check-on-newline nil)

;; shortcut



(global-set-key "\M-m" 'rails-nav:goto-models)

(global-set-key "\M-c" 'rails-nav:goto-controllers)

(global-set-key "\M-l" 'rails-nav:goto-layouts)

(global-set-key "\M-j" 'rails-nav:goto-javascripts)

(global-set-key "\M-C" 'rails-model-layout:switch-to-controller)
(global-set-key "\M-H" 'rails-controller-layout:switch-to-helper)

(global-set-key "\M-M" 'rails-controller-layout:switch-to-model)


