;;;; Base emacs config

;; No startup screen

(setq inhibit-startup-screen t)

;; Remove tool bar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Set nice font

(set-frame-font "Inconsolata-11")

;; Enable column-number-mode

(setq column-number-mode t)

;;;; Package managment

(require 'package)

;; List of required packages
(setq package-list '(
   ;; productivity
   magit
   ws-butler
   find-things-fast

   ;; language modes
   scala-mode
   rust-mode
   markdown-mode
   yaml-mode
   php-mode
   typescript-mode
   dockerfile-mode
   bazel
))

;; Setup Melpa
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Setup package
(package-initialize)

;; Fetch package list
(unless package-archive-contents
  (package-refresh-contents))

;; Install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;;;; Package config

;; find-file-fast

(global-set-key (kbd "C-x t") 'ftf-find-file) ; bind to C-x t
(setq ftf-filetypes '("*"))                   ; allow all filetypes

;; magit

(global-set-key (kbd "C-x g") 'magit-status) ; bind to C-x g

;; rust-mode

(require 'rust-mode)
(setq rust-format-on-save t)
(define-key rust-mode-map (kbd "C-c C-c") 'rust-compile)
(define-key rust-mode-map (kbd "C-c C-r") 'rust-run)

;; ws-butler
(require 'ws-butler)
(ws-butler-global-mode)
