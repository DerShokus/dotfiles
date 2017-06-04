(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-set-key [f5] (lambda () (interactive)
		       (load-file "~/.emacs.d/init.el")))

;; General
(load-theme 'gruvbox t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq make-backup-files nil) ; ~files
(setq auto-save-default nil) ; #files#
(set-default-font "Inconsolata LGC")
(set-face-attribute 'default nil :height 122)

(setq inhibit-startup-screen t)
; Make emacs stop bugging me about symlinks
(setq vc-follow-symlinks t)
(find-file "~/.emacs.d/init.el")

;; Helm
(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)

(setq linum-format " %d ")

(use-package markdown-mode
	     :ensure t
	     :commands (markdown-mode gfm-mode)
	     :mode (("README\\.md\\'" . gfm-mode)
		    ("\\.md\\'" . markdown-mode)
		    ("\\.markdown\\'" . markdown-mode))
	     :init (setq markdown-command "multimarkdown"))

(use-package linum-mode
  :mode (("\\.[ch]pp\\'" . linum-mode)))
(use-package modern-c++-font-lock-mode
  :mode (("\\.[ch]pp\\'" . modern-c++-font-lock-mode)))

(when (package-installed-p 'helm-projectile)
  (projectile-global-mode)
  (helm-projectile-on))

(setq auto-mode-alist
      (append
       (list
	'("\\.cpp$" . c++-mode)
	'("\\.hpp$" . c++-mode)
	'("\\.h$"   . c++-mode)
	)
       auto-mode-alist))

(defun programming-mode-hook ()
  (linum-mode 1))

;; RTags
(require 'package)
(package-initialize)
(require 'rtags)
(require 'company)

(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)
(global-company-mode)
(define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))

(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil))
(add-hook 'c-mode-hook #'my-flycheck-rtags-setup)
(add-hook 'c++-mode-hook #'my-flycheck-rtags-setup)

(defun common-c-mode-hook ()
  (programming-mode-hook)
  (google-set-c-style))

(add-hook 'c-mode-hook 'common-c-mode-hook)
(add-hook 'c++-mode-hook 'common-c-mode-hook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("10e231624707d46f7b2059cc9280c332f7c7a530ebc17dba7e506df34c5332c4" default)))
 '(package-selected-packages
   (quote
    (company-rtags company flycheck-rtags google-c-style ag helm-ag helm-projectile projectile org gruvbox-theme suscolors-theme modern-cpp-font-lock rtags linum-mode exec-path-from-shell markdown-mode helm-themes helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

