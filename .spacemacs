;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     apt
     auto-completion
     better-defaults
     emacs-lisp
     pdf-tools
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     (git :variables)
     haskell
     c-c++
     themes-megapack
     ;;      git-gutter-use-fringe t)
     markdown
     org
     shell
     syntax-checking
     spell-checking
     (latex :variables latex-enable-folding t)
     latex
     clojure
     gnus
     csharp
     python
     themes-megapack
     )
   ;; List of additional packages that will be installed wihout being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(w3m org-pdfview langtool company-ghc ghc ac-haskell-process)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(evil-search-highlight-persist)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Default shell
   shell-default-shell 'shell
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn monokai)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  (push "~/elisp" load-path)
  )

;; Escaping smartparens
(defvar-local smartparens-temp-disabled nil)
(defun smartparens-temp-disable ()
  (interactive)
  (when smartparens-mode
    (smartparens-mode nil)
    (setq smartparens-temp-disabled t)))
(defun smartparens-maybe-reenable ()
  (when smartparens-temp-disabled
    (smartparens-mode)
    (setq smartparens-temp-disabled nil)))

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  ;; golden ratio for autosizing buffers
  (golden-ratio t)
  ;; langtool
  (require 'langtool)
  (setq langtool-language-tool-jar "~/LanguageTool-3.3/languagetool-commandline.jar")
  ;; org mode python support
  (require 'ob-python)
  ;; global smart parens
  (smartparens-global-mode)


  (setq omnisharp-server-executable-path "/home/cgroza/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
  ;; Haskell mode
  (let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
    (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
    (add-to-list 'exec-path my-cabal-path))

  ;; Auto completion for Haskell
  (require 'company)
  (add-hook 'haskell-mode-hook 'company-mode)
  (autoload 'ghc-init "ghc" nil t)
  (autoload 'ghc-debug "ghc" nil t)
  (add-hook 'haskell-mode-hook (lambda () (ghc-init)))
  (add-hook 'interactive-haskell-mode-hook 'ac-haskell-process-setup)
  (add-hook 'haskell-interactive-mode-hook 'ac-haskell-process-setup)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'haskell-interactive-mode))
  (add-to-list 'company-backends 'company-ghc)
  (custom-set-variables '(company-ghc-show-info t))

  ;; Line numbers
  (require 'linum-relative)
  (global-linum-mode)
  (linum-relative-on)

  ;; Inserting files
  (spacemacs/set-leader-keys "oif" 'ido-insert-file)
  (spacemacs/set-leader-keys "oib" 'ido-insert-buffer)
  (spacemacs/set-leader-keys "odl" 'delete-blank-lines)
  ;; langtool bindings
  (spacemacs/set-leader-keys "olb" 'langtool-check-buffer)
  (spacemacs/set-leader-keys "ola" 'langtool-check)
  (spacemacs/set-leader-keys "olc" 'langtool-correct-buffer)
  (spacemacs/set-leader-keys "old" 'langtool-check-done)
  (spacemacs/set-leader-keys "olm" 'langtool-show-message-at-point)
  (spacemacs/set-leader-keys "olp" 'langtool-goto-next-error)
  (spacemacs/set-leader-keys "oln" 'langtool-goto-previous-error)
  (spacemacs/set-leader-keys "oll" 'langtool-switch-default-language)
  ;; Org-mode
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAITING(w)" "DOING(d)" "|" "DONE(D)")))
  (add-hook 'org-mode-hook 'org-agenda-file-to-front)
  (set-input-method 'latin-prefix)

  (add-hook 'text-mode-hook (lambda () (setq line-spacing 0.5)))

  ;; Parenthesis
  ;; (eval-after-load 'smartparens
  ;;   '(progn
  ;;      (sp-pair "(" nil :actions :rem)
  ;;      (sp-pair "[" nil :actions :rem)
  ;;      (sp-pair "'" nil :actions :rem)
  ;;      (sp-pair "\"" nil :actions :rem)))
  (show-paren-mode t)
  (define-key evil-insert-state-map (kbd "M-p") 'smartparens-temp-disable)
  (add-hook 'post-self-insert-hook 'smartparens-maybe-reenable t)
  )

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(org-agenda-files
   (quote
    ("~/University/BiochemNotes.org" "~/.emacs.d/doc/DOCUMENTATION.org" "~/.emacs.d/doc/FAQ.org" "~/University/DraftSchedule.org" "~/.emacs.d/doc/LAYERS.org" "~/org/notes.org" "~/TODO.org" "~/.emacs.d/layers/+vim/evil-snipe/README.org" "~/University/Webcredentials.org" "/mnt/Storage/Projects/Git_Repos/Emacs-apt/README.org")))
 '(org-hide-emphasis-markers t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
