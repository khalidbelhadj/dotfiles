;; Package setup
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (eval-when-compile
    (unless (bound-and-true-p package--initialized)
      (package-initialize))
    (require 'use-package)))

(require 'use-package)
(setq use-package-always-ensure t
      use-package-compute-statistics t)

(use-package exec-path-from-shell
  :config (exec-path-from-shell-initialize))

;; Emacs 29
(unless (< emacs-major-version 29)
  (pixel-scroll-precision-mode))

;; Keymaps
(bind-key* "C-x C-r" 'consult-recent-file)
(bind-key* "C-c C-l" 'compile)


;; Git
(use-package magit
  :commands magit-mode)

(use-package magit-todos
  :after magit
  :config (magit-todos-mode 1))

(use-package git-gutter
  :hook ((prog-mode . git-gutter-mode) (org-mode .git-gutter-mode)))

(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated)))

;; Helpful
(use-package helpful
  :bind
  ([remap describe-function] . helpful-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

;; PDF
(use-package pdf-tools
  :commands pdf-tools-install
  :init
  (local-set-key (kbd "c") 'pdf-view-center-in-window)
  (setq pdf-view-resize-factor 1.025
        doc-view-continuous t
        pdf-view-display-size 'fit-height))

(add-hook 'doc-view-mode-hook 'pdf-tools-install)

;; Modeline
(use-package minions
  :init (minions-mode 1))

;; Highlight indent guides
(use-package highlight-indent-guides
  ;;  :hook (prog-mode . highlight-indent-guides-mode)
  :config (setq highlight-indent-guides-method 'character))

;; Multiple cursors
(use-package multiple-cursors
  :commands multiple-cursors-mode
  :init (setq mc/always-run-for-all t)
  :config
  (multiple-cursors-mode t)
  (bind-key* "C-c SPC" 'mc/edit-lines))

; Vertico Constult
(use-package vertico
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :init (progn (vertico-mode 1) (setq vertico-count 15))
  :config (setq consult-preview-excluded-files '("README\.org")))

(use-package consult
  :commands (consult-recent-file consult-buffer consult-yank-from-kill-ring))
(global-set-key (kbd "M-y") 'consult-yank-from-kill-ring)
(global-set-key (kbd "C-x b") 'consult-buffer)

;; Marginalia
(use-package marginalia
  :after vertico
  :init (marginalia-mode 1))

;; Orderless
(use-package orderless
  :init (setq completion-styles '(orderless)))

;; Theme
(setq custom-safe-themes t)
(use-package doom-themes)
(load-theme 'doom-badger)

;; HL TODO
(use-package hl-todo
  :ensure t
  :custom-face
  (hl-todo ((t (:inherit hl-todo :italic t))))
  :hook ((prog-mode . hl-todo-mode)))

(use-package lsp-mode)
