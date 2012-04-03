;; Colors
(require 'color-theme)

(load-file "~/.emacs.d/color-theme-zenburn.el")
(color-theme-zenburn)

;; Preferences
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; My preferred key bindings
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-x C-s") 'isearch-forward)

;; Use Org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Org mode agenda files
(setq org-agenda-files (list "~/Shared/Org/arp.org"
                             "~/Shared/Org/personal.org"
                             "~/Shared/Org/onelogin.org"))

(setq org-agenda-custom-commands
      '(("f" occur-tree "FIXME")
        ("n" occur-tree "NEXT")))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)"))))
;;              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))

;; Custom TODO keyword faces
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "#e0cf9f" :background "skyblue4" :weight bold)
              ("NEXT" :foreground "yellow" :weight bold)
              ("DONE" :foreground "#afd8af" :weight bold))))

;; Org mode key bindings
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "<f11>") 'org-clock-goto)

;; Org mode preferences
(setq org-log-done t)
(setq org-agenda-start-with-follow-mode t)
(setq org-agenda-start-with-clockreport-mode t)

;; flyspell mode for spell checking everywhere
(add-hook 'org-mode-hook 'turn-on-flyspell 'append)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
