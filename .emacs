;;;; Base emacs config

;; No startup screen

(setq inhibit-startup-screen t)

;; Remove tool bar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Set nice font

(set-default-font "Inconsolata-11")

;; Enable column-number-mode

(setq column-number-mode t)

;;;; Package managment

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;;; Package config

;; ensime

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; find-file-fast

(global-set-key (kbd "C-x t") 'ftf-find-file) ; bind to C-x t
(setq ftf-filetypes '("*"))                   ; allow all filetypes

;; magit

(global-set-key (kbd "C-x g") 'magit-status)

