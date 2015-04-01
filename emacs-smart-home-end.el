;;; emacs-smart-home-end.el --- Smart `Home' and `End' keys.

;;; Commentary:

;;; Enables easy navigation with `Home' and `End' keys across wrapped lines (in Visual Line Mode).
;;; - Hit the key once to navigate to the beginning/end of the wrapped (screen) line.
;;; - Hit the key again to navigate to the beginning/end of the previous/next wrapped (screen) line.
;;; - Repeat until you reach the beginning/end of the logical line.
;;; - `Home' key additionally supports jumping between the first non-blank character in the logical line and start of the logical line.

;;; Code:

(defun emacs-smart-home ()
  "Move between beginnings of visual lines, first non-blank character in the logical line and start of the logical line."
  (interactive)
  (let* ((oldpos (point))
         (oldcol (current-column))
         (visual-pos)
         (text-pos))
    (cond ((eq 0 oldcol) (beginning-of-line-text))
          (t (save-excursion
                (beginning-of-visual-line)
                (setq visual-pos (point))
                (beginning-of-line-text)
                (setq text-pos (point)))
              (if (and (eq oldpos visual-pos) (> visual-pos text-pos))
                  (save-excursion
                    (left-char)
                    (beginning-of-visual-line)
                    (setq visual-pos (point))))
              (cond ((eq oldpos text-pos) (beginning-of-line))
                    (t (goto-char (max visual-pos text-pos))))))))

(defun emacs-smart-end ()
  "Move between ends of visual lines and end of the logical line."
  (interactive)
  (let* ((oldpos (point))
         (visual-pos)
         (text-pos))
    (save-excursion
      (end-of-visual-line)
      (setq visual-pos (point))
      (end-of-line)
      (setq text-pos (point)))
    (if (and (eq oldpos visual-pos) (< visual-pos text-pos))
        (save-excursion
          (right-char)
          (end-of-visual-line)
          (setq visual-pos (point))))
    (goto-char (min visual-pos text-pos))))


(provide 'emacs-smart-home-end)
;;; emacs-smart-home-end.el ends here
