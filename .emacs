;; Colors
(require 'color-theme)

(load-file "~/.emacs.d/color-theme-zenburn.el")
(color-theme-zenburn)

;; Preferences
(if window-system
  (tool-bar-mode -1))
(if window-system
  (scroll-bar-mode -1)
)

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
         (
          (tags-todo "/!CODE3"
                     ((org-agenda-overriding-header "Immediate Tasks")
                      (org-agenda-todo-ignore-scheduled t)
                      (org-agenda-todo-ignore-deadlines t)
                      (org-agenda-todo-ignore-with-date t)
                      (org-tags-match-list-sublevels t)
                      (org-agenda-sorting-strategy
                        '(todo-state-down effort-up category-keep))))
          (tags-todo "/!NEXT"
                     ((org-agenda-overriding-header "Next Tasks")
                      (org-agenda-todo-ignore-scheduled t)
                      (org-agenda-todo-ignore-deadlines t)
                      (org-agenda-todo-ignore-with-date t)
                      (org-tags-match-list-sublevels t)
                      (org-agenda-sorting-strategy
                        '(todo-state-down effort-up category-keep))))
          (agenda "" nil)
          nil))))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "CODE3(3)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELED(c@/!)" "PHONE"))))
(setq org-todo-state-tags-triggers
      (quote (("CANCELED" ("CANCELED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING" . t) ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELED") ("HOLD"))
              ("CODE3" ("WAITING") ("CANCELED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELED") ("HOLD")))))

;; Custom TODO keyword faces
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "#e0cf9f" :background "skyblue4" :weight bold)
              ("NEXT" :foreground "yellow" :weight bold)
              ("CODE3" :foreground "#ff0404" :background "#3d0a17" :weight bold)
              ("DONE" :foreground "#afd8af" :weight bold)
              ("CANCELED" :foreground "#82a782" :weight bold)
              ("WAITING" :foreground "#e59c92" :weight bold)
              ("HOLD" :foreground "#c1bfb9" :weight bold))))

;; #ef7171 is a nice red, even slightly pink, that stands out, but not too much
;; #f9b2a9 same, but stands out less
;; #a4ef71 is a nice green that stands out, but not too much
;; #c0ffee ain't bad either
;; #1d196a is a dark blue we used initially for CODE3 background; #070e6b is darker blue

; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%60ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")
; global Effort estimate values
(setq org-global-properties (quote (("Effort_ALL" . "1 2 3 4"))))

;; Org mode key bindings
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "<f11>") 'org-clock-goto)

;; Org mode preferences
(setq org-log-done t)
;; (setq org-agenda-start-with-follow-mode t)
(setq org-agenda-start-with-clockreport-mode nil)
(setq org-deadline-warning-days 7)
(setq org-agenda-ndays 1)

(setq org-clock-modeline-total 'current)

;; flyspell mode for spell checking everywhere
(add-hook 'org-mode-hook 'turn-on-flyspell 'append)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

;; Always split side-by-side
(setq split-height-threshold nil)
(setq split-width-threshold 0)
