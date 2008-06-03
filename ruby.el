(require 'hideshow)

(defun ruby-custom-setup ()
; [other stuff omitted...]
  (add-to-list 'hs-special-modes-alist
               '(ruby-mode
                 "\\(def\\|do\\)"
                 "end"
                 "#"
                 (lambda (arg) (ruby-end-of-block))
                 nil
                 ))
  (hs-minor-mode t)
)

(add-hook 'ruby-mode-hook 'ruby-custom-setup)

