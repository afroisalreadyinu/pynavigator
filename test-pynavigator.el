;; run with Emacs -q --batch -l pynavigator.el -l test-pynavigator.el -f ert-run-tests-batch-and-exit
(require 'ert)
(require 'pynavigator)
(require 'package)
(package-initialize)

(require 's)

(defvar pyng-dummy-var nil)

(defun load-py-contents ()
  (let* ((this-file (symbol-file 'pyng-dummy-var))
	 (py-file (s-replace "test-pynavigator.el" "testfile.py" this-file)))
    (insert-file-contents py-file)))


(ert-deftest test-identifier ()
  (with-temp-buffer
    (load-py-contents)
    (goto-char (point-max))
    (search-backward "aMethod")
    (should (equal (pyng-identifier-at-point) "aMethod"))))

(ert-deftest test-find-definition ()
  (with-temp-buffer
    (load-py-contents)
    (should (equal (find-definition "aMethod") 3))))
