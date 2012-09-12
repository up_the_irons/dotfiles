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
                             "~/Shared/Org/personal.org"))

;; (setq org-agenda-compact-blocks t)

(setq org-agenda-custom-commands
      '(("f" occur-tree "FIXME")
        ("n" occur-tree "NEXT")
        (" " "Agenda"
         ((agenda "" nil)
          (tags-todo "/!NEXT"
                     ((org-agenda-overriding-header "Next Tasks")
                      (org-agenda-todo-ignore-scheduled t)
                      (org-agenda-todo-ignore-deadlines t)
                      (org-agenda-todo-ignore-with-date t)
                      (org-tags-match-list-sublevels t)
                      (org-agenda-sorting-strategy
                        '(todo-state-down effort-up category-keep))))
          nil))))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING" . t) ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

;; Custom TODO keyword faces
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "#e0cf9f" :background "skyblue4" :weight bold)
              ("NEXT" :foreground "yellow" :weight bold)
              ("DONE" :foreground "#afd8af" :weight bold)
              ("CANCELLED" :foreground "#82a782" :weight bold))))

; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%60ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")
; global Effort estimate values
(setq org-global-properties (quote (("Effort_ALL" . "1 2 3 4"))))

;; Org mode key bindings
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "<f11>") 'org-clock-goto)

;; Org mode preferences
(setq org-log-done t)
(setq org-agenda-start-with-follow-mode t)
(setq org-agenda-start-with-clockreport-mode t)
(setq org-deadline-warning-days 5)

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
