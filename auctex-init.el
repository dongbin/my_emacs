;;auctex

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; 使用 LaTeX mode 的时候打开 auto-fill mode 和 outline-minor mode
(add-hook 'LaTeX-mode-hook
          (function (lambda ()
                      (auto-fill-mode t)
                      (outline-minor-mode)
                      (flyspell-mode)
                      (reftex-mode)
                      (tex-source-specials-mode))))
(add-hook 'latex-mode-hook
          (function (lambda ()
                      (auto-fill-mode)
                      (outline-minor-mode)
                      (flyspell-mode)
                      (reftex-mode)
                      (tex-source-specials-mode))))
