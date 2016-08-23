(eval-when-compile (require 'cl))

(defun pyng-identifier-at-point ()
  (thing-at-point 'word))

(defun find-in-buffer (s)
  "Find string s in current buffer and return position."
  (save-excursion
    (goto-char (point-max))
    (let* ((search-found (search-backward s nil t)))
      (if search-found (line-number-at-pos) nil))))


(defun find-definition (name)
  (cl-some #'find-in-buffer
	   (list (concat "def " name)
		 (concat name " = "))))


(defun goto-def ()
  (interactive)
  (let* ((identifier-name (pyng-identifier-at-point))
	 (line-no (find-definition identifier-name)))
    (if line-no (goto-line line-no) (message (concat "Could not find definition for " identifier-name)))))


(provide 'pynavigator)
