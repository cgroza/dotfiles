;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.


(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(ruby
     javascript
     lsp
     ;; ipython-notebook
     rust
     common-lisp
     clojure
     groovy
     yaml
     themes-megapack
     html
     csv
     python
     (c-c++ :variables c-c++-backend 'lsp-clangd)
     bibtex
     pandoc
     helm
     latex
     pdf
     spacemacs-purpose
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     (org :variables org-enable-reveal-js-support t org-enable-roam-support t org-enable-roam-protocol t)
     (ess :variables ess-r-backed 'lsp ess-help-own-frame t)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     evil-snipe
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(yasnippet-snippets yasnippet-snippets
                                                         dired-rsync ob-async
                                                         ;;ob-ipython
                                                         ;; polymode poly-R poly-markdown
                                                         ;; poly-org poly-noweb
                                                         outline-magic
                                                         ;;(nextflow-mode :location (recipe :fetcher github :repo "jackkamm/nextflow-mode"))
                                                         exec-path-from-shell transpose-frame)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(smartparens evil-escape)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; dotspacemacs
   dotspacemacs-use-spacelpa t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(modus-operandi
                         modus-vivendi
                         darkokai
                         solarized-light
                         solarized-dark
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 0.8)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   org-ref-default-bibliography '("~/Dropbox/Bib/cgroza.bib")
   evil-want-Y-yank-to-eol nil
   org-roam-v2-ack t
   org-directory "~/Dropbox/Org"
   org-default-notes-file "work.org"
   org-agenda-files '("~/Dropbox/Org/org-roam")
   org-capture-templates ()))


(defun magit-display-buffer-pop-up-frame (buffer)
  (if (with-current-buffer buffer (eq major-mode 'magit-status-mode))
      (display-buffer buffer
                      '((display-buffer-reuse-window
                         display-buffer-pop-up-frame)
                        (reusable-frames . t)))
    (magit-display-buffer-traditional buffer)))


(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq latex-build-command "LatexMk")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; import PATH from a running shell instance
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))

  ;; to use pdfview with auctex
  (with-eval-after-load 'reftex
    (add-to-list 'reftex-default-bibliography "~/Dropbox/Bib/cgroza.bib")
  )

  ;; helm bibtex
  (with-eval-after-load 'helm-bibtex
    (setq bibtex-completion-bibliography '("~/Dropbox/Bib/cgroza.bib"))
  )

  ;; custom key bindings
  (define-key evil-normal-state-map (kbd "SPC '") 'my-shell)
  ;; (global-set-key (kbd "<f5>") 'yas-expand)

  ;; yasnippets
  (yas-global-mode t)

  (setq lsp-signature-auto-activate nil
        lsp-enable-symbol-highlighting nil)

  (with-eval-after-load 'lsp-ui
    (setq lsp-ui-doc-delay 0.5
          lsp-ui-doc-position 'bottom
          lsp-ui-doc-alignment 'window))

  ;; asynchronous execution of code blocks
  ;; org babel languages
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((shell . t)
                                 (R . t) (python . t)
                                 ;; (ipython . t)
                                 (emacs-lisp . t)))

  (setq org-confirm-babel-evaluate nil
        ;; inline image width
        org-image-actual-width 600
        org-export-with-drawers nil
        ;; org-startup-indented 't
        org-startup-indented nil
        ;; org-indent-indentation-per-level 0
        ;; org src editing window position
        org-src-window-setup 'split-window-below
        ;; to support references in org-mode latex export
        org-babel-default-header-args '((:tangle . "yes")
                                        (:async . "yes")
                                        (:eval . "no-export")
                                        (:results . "replace")
                                        (:session . "none")
                                        (:hlines . "no")
                                        (:noweb . "no")
                                        (:cache . "no")
                                        (:exports . "results")
                                        )
        )

  ;; (push '("b" "Brain" plain (function org-brain-goto-end)
  ;;         "* %i%?" :empty-lines 1)
  ;;       org-capture-templates)

  (spacemacs/set-leader-keys-for-major-mode 'python-mode
    "s l" 'python-shell-send-line
    "s L" 'python-shell-send-line-switch)

  (spacemacs/set-leader-keys "gfm" 'magit-file-dispatch
    "ow" 'writeroom-mode
    "ot" 'transpose-frame
    "oT" 'treemacs
    "oa" 'my-make-analysis-dir
    "op" 'my-publish-pdf
    "om" 'imenu-list-minor-mode
    "ob" 'helm-bibtex-with-local-bibliography
    "-" 'imenu-list-show
    "ol" 'my-cleanup-latex
    )
  (setq org-roam-directory "~/Dropbox/Org/org-roam")

  ;; user defined variables
  (setq lsp-rust-server "~/bin/rust-analyzer"
        lsp-idle-delay 1.0
        read-process-output-max (* 1024 1024)
        c-default-style "gnu"
        python-shell-interpreter "ipython"
        my-analysis-dir  "~/analysis/"
        my-publish-pdf-dir "~/git/wikicgroza/slides/"
        evil-want-Y-yank-to-eol nil
        ess-eval-visibly 'nowait
        live-py-version "python3"
        compilation-scroll-output t
        magit-repository-directories '(("~/git" . 1))
        magit-display-buffer-function #'magit-display-buffer-pop-up-frame
        ;; file associations
        auto-mode-alist
        (append
         '(("\\.tut$" . tutch-mode)
           ("\\.req$" . tutch-mode)
           ("\\.nf$" . nextflow-mode))
         auto-mode-alist)
        ;; TeX
        TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
        TeX-source-correlate-start-server t ;; not sure if last line is neccessary
        ;; LSP
        lsp-clients-clangd-executable "/usr/local/opt/llvm/bin/clangd"
        lsp-clang-executable "/usr/local/opt/llvm/bin/clangd"
        )

  ;; Font
  ;; (add-to-list 'default-frame-alist '(font . "Scurce Code Pro:pixelsize=13"))

  ;; auto hide compilation buffer when successful
  (add-hook 'compilation-finish-functions
            (lambda (buf str)
              (if (null (string-match ".*exited abnormally.*" str))
                  ;;no errors, make the compilation window go away in a few seconds
                  (progn
                    (run-at-time
                     "1 sec" nil 'delete-windows-on
                     (get-buffer-create "*compilation*"))
                    (message "No Compilation Errors!")))))

  ;; outline mode keybind for section hide/cycle
  (eval-after-load 'outline
    '(progn
       (require 'outline-magic)
       (define-key outline-minor-mode-map (kbd "<C-tab>") 'outline-cycle)))

  (add-to-list 'load-path "~/git/twauctex/")
  (require 'twauctex)
  (twauctex-global-mode)

  (setq winum-scope 'frame-local)

  ;; Hooks
  ;; (remove-hook 'org-mode-hook 'poly-org-mode)
  ;; outline for folding sections
  (add-hook 'TeX-mode-hook 'outline-minor-mode)
  ;; to have the buffer refresh after compilation
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)
  ;; hooks
  (add-hook 'TeX-mode-hook 'orgtbl-mode)
  (remove-hook 'eshell-mode-hook #'company-mode)
  ;; interferes with twauctex
  (remove-hook 'LaTeX-mode-hook #'latex/auto-fill-mode)
  ;; disable highlighting current line
  (global-hl-line-mode -1)
  (global-visual-fill-column-mode -1)
  (global-eldoc-mode -1)
  (spacemacs/toggle-maximize-frame-on)
)

(defvar my-latex-cleanup-referenced-files
  "\\\\\\(includegraphics\\|addbibresource\\|include\\)\\(\\[.*\\]\\)?{\\(.*\\)}"
  )

;; Custom functions
(defun my-cleanup-latex ()
  """
Copies the TeX file to a new directory.
Walks all includegraphics, include, addbibresource states and copies referenced files to the root of the new directories.
Edits the referenced file paths in the copied TeX files to point to the new paths in the new root directory.
Assumes that all referenced file paths are relative to the directory of the TeX file, and are not absolute.
  """
  (interactive)
  (if TeX-mode-p
      (if buffer-file-name
          (let* ((clean-directory (read-directory-name "Export directory"))
                 (new-latex-file (concat clean-directory (file-name-nondirectory buffer-file-name)))
                 (original-directory (file-name-directory buffer-file-name)))
            (message "%s %s %s" clean-directory original-directory new-latex-file)
            (make-directory clean-directory t)
            (save-buffer)
            (copy-file buffer-file-name new-latex-file)
            (save-excursion
              (switch-to-buffer (find-file new-latex-file))
              (beginning-of-buffer)
              (while (re-search-forward my-latex-cleanup-referenced-files nil t)
                (let* ((referenced-file (concat original-directory (string-trim (match-string 3)) ))
                       (referenced-name (file-name-nondirectory referenced-file))
                       (destination-file (concat clean-directory referenced-name)))
                  (message "Copying %s to %s" referenced-file destination-file)
                  (copy-file referenced-file destination-file)
                  (replace-match (format "\\\\\\1\\2{%s}" referenced-name))
                  )
                )
              (save-buffer)
              (kill-current-buffer)
              )
            )
        (message "Not visiting a file."))
    (message "Not a TeX file!"))
  )


(defun my-make-analysis-dir ()
  (interactive)
  (let* ((dir (read-file-name "Analysis directory" my-analysis-dir))
         (date (car (split-string (shell-command-to-string "date +%d_%m_%Y") )))
         (full-path (concat dir "_" date "/"))
         (file-name (concat full-path
                            (file-name-nondirectory (directory-file-name (file-name-directory full-path)))
                            ".org")))

         (make-directory full-path)
         (magit-init full-path)
         (find-file file-name)
         (save-buffer)
         (magit-stage-file file-name)
         )
  )

(defun my-shell ()
  (interactive)
  (eshell (generate-new-buffer-name "shell"))
  )

(defun my-publish-pdf ()
  (interactive)
  (let ((pdf-path
         (concat (file-name-sans-extension buffer-file-name) ".pdf")
         ))
    (copy-file pdf-path (read-directory-name "Publication directory" my-publish-pdf-dir) 1)))

(defun python-shell-send-line ()
  (interactive)
  (python-shell-send-string (thing-at-point 'line t)))

(defun python-shell-send-line-switch ()
  (interactive)
  (python-shell-send-string (thing-at-point 'line t))
  (python-shell-switch-to-shell)
  )


(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-move-beyond-eol t)
 '(evil-undo-system 'undo-tree)
 '(evil-want-Y-yank-to-eol nil)
 '(flycheck-lintr-linters "with_defaults(line_length_linter(120))")
 '(package-selected-packages
   '(org-roam ob-ess-julia seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv rake minitest helm-gtags ggtags enh-ruby-mode counsel-gtags counsel swiper chruby bundler inf-ruby add-node-modules-path yasnippet-snippets vterm live-py-mode link-hint hungry-delete google-translate forge magit editorconfig company blacken apropospriate-theme anaconda-mode helm lsp-mode treemacs posframe projectile bibtex-completion modus-themes all-the-icons which-key evil zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler writeroom-mode winum white-sand-theme web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill undo-tree underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil transpose-frame toxi-theme toml-mode toc-org terminal-here tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon symbol-overlay sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection string-edit sphinx-doc spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode ron-mode reverse-theme restart-emacs rebecca-theme rainbow-delimiters railscasts-theme racer pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme prettier-js popwin poetry planet-theme pippel pipenv pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme pdf-view-restore pcre2el password-generator parsebib paradox pandoc-mode ox-pandoc overseer outline-magic orgit-forge organic-green-theme org-superstar org-rich-yank org-ref org-re-reveal org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-brain open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-async npm-mode nose nodejs-repl noctilux-theme naquadah-theme nameless mwim mustang-theme multi-term multi-line monokai-theme monochrome-theme molokai-theme moe-theme modus-vivendi-theme modus-operandi-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-svn magit-section magit-gitflow madhat2r-theme macrostep lush-theme lsp-ui lsp-python-ms lsp-pyright lsp-origami lsp-latex lorem-ipsum livid-mode light-soap-theme kaolin-themes json-navigator json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide importmagic impatient-mode hybrid-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme groovy-mode groovy-imports grandshell-theme goto-chg gotham-theme google-c-style golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ ghub gh-md gandalf-theme fuzzy font-lock+ flyspell-correct-helm flycheck-ycmd flycheck-rust flycheck-rtags flycheck-pos-tip flycheck-package flycheck-elsa flx-ido flatui-theme flatland-theme farmhouse-theme fancy-battery eziam-theme eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-snipe evil-org evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-ediff evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu ess-R-data-view espresso-theme eshell-z eshell-prompt-extras esh-help emr emmet-mode elisp-slime-nav dumb-jump drag-stuff dracula-theme dotenv-mode doom-themes django-theme disaster dired-rsync dired-quick-sort diminish devdocs define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dap-mode dakrone-theme cython-mode cyberpunk-theme csv-mode cpp-auto-include company-ycmd company-web company-rtags company-reftex company-math company-c-headers company-auctex company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme closql clean-aindent-mode chocolate-theme cherry-blossom-theme cfrs centered-cursor-mode ccls cargo busybee-theme bubbleberry-theme browse-at-remote birds-of-paradise-plus-theme biblio badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-window ace-link ace-jump-helm-line ac-ispell))
 '(prog-mode-hook
   '(spacemacs/load-yasnippet spacemacs//trailing-whitespace rainbow-delimiters-mode spacemacs//enable-hs-minor-mode highlight-parentheses-mode highlight-numbers-mode flyspell-prog-mode spacemacs//load-evil-lisp-state bug-reference-prog-mode goto-address-prog-mode spacemacs//put-clean-aindent-last))
 '(safe-local-variable-values
   '((org-ref-default-bibliography . /Users/cgroza/git/cgroza\.github\.io/_bibliography/references\.bib)
     (org-ref-default-bibliography . /Users/cgroza/git/2020_paper/cgroza\.bib)
     (javascript-backend . tide)
     (javascript-backend . tern)
     (javascript-backend . lsp)))
 '(writeroom-global-effects
   '(writeroom-set-alpha writeroom-set-menu-bar-lines writeroom-set-tool-bar-lines writeroom-set-vertical-scroll-bars writeroom-set-bottom-divider-width))
 '(writeroom-width 120))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
