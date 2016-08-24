(eval-when-compile (require 'cl))

(defun pyng-identifier-at-point ()
  (symbol-name (symbol-at-point)))

(defun pyng-find-in-buffer (s)
  "Find string s in current buffer and return position."
  (save-excursion
    (goto-char (point-max))
    (let* ((search-found (search-backward s nil t)))
      (if search-found (line-number-at-pos) nil))))


(defun pyng-find-definition (name)
  (cl-some #'pyng-find-in-buffer
	   (list (concat "def " name)
		 (concat name " = "))))


(defun pyng-goto-def ()
  (interactive)
  (let* ((identifier-name (pyng-identifier-at-point))
	 (line-no (pyng-find-definition identifier-name)))
    (if line-no (goto-line line-no) (message (concat "Could not find definition for " identifier-name)))))

;; Minor mode

(defvar pynavigator-mode-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c d") 'pyng-goto-def)
    map)
  "The keymap for abl-mode")

;;;###autoload
(define-minor-mode pynavigator-mode
  "Minor mode for navigating Python codebases"
  :keymap pynavigator-mode-keymap)


(provide 'pynavigator)
