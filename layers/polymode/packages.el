;;; packages.el --- polymode layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Walmes Zeviani & Fernando Mayer
;; URL: https://github.com/syl20bnr/spacemacs

;;; Code:

(defconst polymode-packages
  '(polymode
    poly-R
    poly-markdown
    poly-org
    poly-noweb))

(defun polymode/init-polymode ()
  (use-package polymode
    :mode (("\\.Rmd"   . Rmd-mode))
    :init
    (progn
      (defun Rmd-mode ()
        "ESS Markdown mode for Rmd files"
        (interactive)
        (require 'poly-R)
        (require 'poly-markdown)
        (poly-markdown+r-mode))
      )
    )
  )

;;; packages.el ends here
