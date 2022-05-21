;;; BASICS
;; Cant handle this ugly screen
(setq inhibit-startup-message t)
(setq initial-scratch-message ";; Hello João")
;; Can I use escape to, idk, ESCAPE!
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; Yes or no? More like y or n 
(defalias 'yes-or-no-p 'y-or-n-p)
;; I like line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
;; Remove bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; No autosave and no backup pls
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq make-backup-files nil)
;; Stop it, emacs-san, dont put it in there
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; Use emacs default project manager
(require 'project)
;; Function to set my fonts
(setq favorite-font "JetBrainsMono Nerd Font")
(defun set-font-faces (font-face height) 
    (set-face-attribute 'default nil :font font-face :height height)
    (set-face-attribute 'variable-pitch nil :font font-face :height 110))
(if (member favorite-font (font-family-list))
    (set-font-faces favorite-font 130)
    (set-face-attribute 'default nil :height 130)
    (set-face-attribute 'variable-pitch nil :height 130))

;;; PACKAGES
;; Activate package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; Use package to use packages
(require 'use-package)
(setq use-package-always-ensure t) ;; install all packages
;; Ido because tsoding recommended
(require 'ido)
(ido-mode 1)
;; Lets get evil
(setq evil-want-keybinding nil)
(setq evil-want-C-d-scroll t)
(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)
(setq evil-want-Y-yank-to-eol t)
(use-package evil
  :init 
  (setq evil-want-integration t)
  :ensure t
  :config
  (evil-mode 1))
(use-package evil-collection
  :after evil
  :diminish
  :config
  (evil-collection-init))
;; I need to be shown some keybindings
(use-package which-key
  :diminish
  :init
  (setq which-key-delay 0.3)
  :config
  (which-key-mode))
;; The best plugin ever
(use-package magit
  :bind ("C-x g" . magit-status))
;; Good completions
(use-package counsel
  :bind (("C-s" . swiper)
	 ("C-c C-c" . counsel-git-checkout)
	 ("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)))
;; Lets get some themes installed
(use-package doom-themes
  :config
  (load-theme 'doom-acario-dark t))
(use-package all-the-icons)
(use-package doom-modeline
  :init
  (setq doom-modeline-unicode-fallback t)
  (setq doom-modeline-height 4)
  :config
  (doom-modeline-mode))
;; Basic config for some programming languages
(use-package yaml-mode)
(use-package json-mode)
(use-package markdown-mode)
(use-package typescript-mode
  :mode ("\\.ts[x]*?\\'" . typescript-mode))
(use-package company
  :init
  (setq company-minimum-prefix-length 2)
  :config
  (global-company-mode)
  (company-tng-configure-default))

;; CODING
;; Lsp with eglot
(global-eldoc-mode) ;; Documentation on everything
(use-package eglot)
(add-hook 'prog-mode-hook 'eglot-ensure)
;; Config for python dev
(use-package python-mode
  :mode ("\\.py?\\'" . python-mode))
(use-package pyvenv)
;; MISCELANEOUS
;; Define keybindings, general
(use-package general)
(general-evil-setup t)
;; * Mode Keybindings
(nmap
  :keymaps 'emacs-lisp-mode-map
  "K" 'elisp-slime-nav-describe-elisp-thing-at-point)

;; Bring some of my vim keybindings here (this is evil)
(nmap
 :prefix "SPC"
 "n g" 'magit-status
 "q" 'kill-buffer
 "b" 'counsel-ibuffer
 "e" 'dired
 "f" 'counsel-find-file)
;; Use q to quit commit editing in magit
(nmap
  :keymaps 'with-editor-mode-map
  "q" 'with-editor-finish
  "C-c" 'with-editor-cancel)
;; I'm blind. Let me increase the font
(nmap
  "C-=" 'text-scale-increase
  "C--" 'text-scale-decrease)
;; Make emacs helpful
(use-package helpful)
(nmap
 "C-h f" 'helpful-callable
 "C-h v" 'helpful-variable
 "C-h k" 'helpful-key
 "C-h F" 'helpful-function
 "C-h C" 'helpful-command
 "C-c C-d" 'helpful-at-point)
