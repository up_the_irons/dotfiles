(require 'color-theme)

(load-file "~/.emacs.d/color-theme-zenburn.el")
(color-theme-zenburn)

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-log-done t)

(setq org-agenda-files (list "~/Shared/Org/gtd.org"
                             "~/Shared/Org/onelogin.org"))

;; flyspell mode for spell checking everywhere
(add-hook 'org-mode-hook 'turn-on-flyspell 'append)
