
(require 'pabbrev)

(defun try-complete-abbrev (old)
   (if (expand-abbrev) t nil))

(setq hippie-expand-try-functions-list
      '(
        try-complete-abbrev
      try-expand-all-abbrevs

    try-expand-dabbrev
      try-expand-dabbrev-all-buffers

      try-expand-list
;;;      try-expand-line
;;;       try-complete-file-name
;;;      try-expand-dabbrev-from-kill
;;;      try-complete-file-name-partially
;;;      try-complete-file-name
;;;      try-complete-lisp-symbol-partially
;;;      try-complete-lisp-symbol
))

(global-set-key "\t" 'hippie-expand)