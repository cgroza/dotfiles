;; tutch-mode 
;; indentations & syntax highlighting & 
;; C-c C-c to compile & C-c C-l to check against a requirement file

(defvar tutch-mode-hook nil)

(require 'comint)
(setq tutch-compile-command "tutch -v")
(setq tutch-shell-name "bash")
(defun tutch-compile ()
	(interactive)
	(save-buffer)
	(apply 'make-comint "tutch" tutch-shell-name nil '())
	(let ((filename (buffer-file-name)))
		(switch-to-buffer-other-window "*tutch*")
		(comint-send-string (get-buffer-process "*tutch*") (concat tutch-compile-command " " filename "\n"))))

(defun tutch-check-against ()
	(interactive)
	(save-buffer)
	(apply 'make-comint "tutch" tutch-shell-name nil '())
	(let ((filename (buffer-file-name)) (reqname (read-file-name "Requirement file: ")))
		(switch-to-buffer-other-window "*tutch*")
		(comint-send-string (get-buffer-process "*tutch*") (concat tutch-compile-command " " filename " " " -r " reqname "\n"))))

(defvar tutch-mode-map
  (let ((map (make-keymap)))
		(define-key map (kbd "C-c C-c") 'tutch-compile)
		(define-key map (kbd "C-c C-l") 'tutch-check-against)
    map)
  "Keymap for tutch major mode")

(add-to-list 'auto-mode-alist '("\\.tut\\'" . tutch-mode))

(defconst tutch-font-lock-keywords
  (list
   '("\\<\\(annotated\\|begin\\|classical\\|end\\|proof\\|rec\\|term\\|val\\)\\>" . font-lock-keyword-face)
   '("\\<\\(case\\|f\\(?:n\\|st\\)\\|in[lr]\\|let\\|snd\\)\\>" . font-lock-builtin-face)
   '("\\<\\(T\\|F\\)\\>" . font-lock-constant-face)
   '("\\<\\([A-Z][a-zA-Z0-9_']*\\)\\>" . font-lock-type-face)
   '("\\<\\([a-z][a-zA-Z0-9_']*\\)\\>" . font-lock-variable-name-face)
   '("\\(~\\)" . font-lock-negation-char-face))
  "Highlighting expressions for tutch mode")

(defun tutch-indent-line ()
  "Indent current line as tutch code"
  (interactive)
	(beginning-of-line)
	(let ((indent 0) (close (looking-at "^[[:space:]]*[])]")))
		(save-excursion 
			(ignore-errors
				(backward-up-list)
				(if close (setq indent (current-column))
					(forward-char)
					(re-search-forward "[^[:space:]]")
					(backward-char)
					(setq indent (current-column)))))
		(indent-line-to indent)))

(defvar tutch-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?% "<" st)
    (modify-syntax-entry ?\n ">" st)
    st))

(defun tutch-mode ()
  "Major mode for editing tuch files"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table tutch-mode-syntax-table)
  (use-local-map tutch-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(tutch-font-lock-keywords))
  (setq default-tab-width 2)
  (set (make-local-variable 'indent-line-function) 'tutch-indent-line)
  (setq major-mode 'tutch-mode)
  (setq mode-name "Tutch")
  (run-hooks 'tutch-mode-hook))

