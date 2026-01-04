(load-file "/usr/share/emacs/site-lisp/themes/zenburn-theme.el")

;; Put backup files in ~/tmp/emacs-backups/
(setq backup-directory-alist '(("." . "~/tmp/emacs-backups/")))

;; Create the directory if it doesn't exist
(make-directory "~/tmp/emacs-backups/" t)

(setq auto-save-file-name-transforms
      '((".*" "~/tmp/emacs-backups/" t)))

; ;; Dependencies
; (load-file "~/.emacs.d/org-depend.el")
(defun mm/org-insert-trigger ()
  "Automatically insert chain-find-next trigger when entry becomes NEXT"
  (cond ((equal org-state "NEXT")
         (unless org-depend-doing-chain-find-next
           (org-set-property "TRIGGER" "chain-find-next(NEXT,from-current,priority-up,effort-down)")))
        ((not (member org-state org-done-keywords))
         (org-delete-property "TRIGGER"))))

(add-hook 'org-after-todo-state-change-hook 'mm/org-insert-trigger)

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

; ;; Use Org mode
; (require 'org-install)
; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
; 
; (global-set-key "\C-cl" 'org-store-link)
; (global-set-key "\C-cc" 'org-capture)
; (global-set-key "\C-ca" 'org-agenda)
; (global-set-key "\C-cb" 'org-iswitchb)
; 
;; Org mode agenda files

;; The old set
;;(setq org-agenda-files (list "~/Shared/Org/arp.org"
;;                             "~/Shared/Org/personal.org"))

;; Pre-2026
;;(setq org-agenda-files (list "~/Orgzly/ARP Networks.org"
;;                             "~/Orgzly/Daily.org"
;;                             "~/Orgzly/Dating.org"
;;                             "~/Orgzly/Home.org"
;;                             "~/Orgzly/McKinsey.org"
;;                             "~/Orgzly/Personal.org"
;;                             "~/Orgzly/Reading.org"
;;                             "~/Orgzly/Writing.org"))

(setq org-agenda-files (list "~/Phone/Orgzly/Global.org"))

;; Set default capture file
(setq org-default-notes-file "~/path/to/Global.org")

;; Basic capture template
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Phone/Orgzly/Global.org" "Inbox")
         "* TODO %?")))

;; Key bindings
(global-set-key (kbd "C-c c") 'org-capture)

;; (setq org-agenda-compact-blocks t)

(setq org-agenda-custom-commands
      '(("f" occur-tree "FIXME")
        ("n" occur-tree "NEXT")
        (" " "Agenda"
         (
          (tags-todo "/!BLOCKED"
                     ((org-agenda-overriding-header "Blocked Tasks")
                      (org-agenda-todo-ignore-scheduled t)
                      (org-agenda-todo-ignore-deadlines t)
                      (org-agenda-todo-ignore-with-date t)
                      (org-tags-match-list-sublevels t)
                      (org-agenda-sorting-strategy
                        '(todo-state-down effort-up category-keep))))
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
      (quote ((sequence "TODO(t)" "NEXT(n)" "CODE3(3)" "BLOCKED(b@/!)" "|" "DONE(d!/!)")
              (sequence "DELG(l)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELED(c@/!)" "PHONE"))))
(setq org-todo-state-tags-triggers
      (quote (("CANCELED" ("CANCELED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING" . t) ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELED") ("HOLD"))
              ("CODE3" ("WAITING") ("CANCELED") ("HOLD"))
              ("BLOCKED" ("WAITING") ("CANCELED") ("HOLD"))
              ("DELG" ("WAITING") ("CANCELED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELED") ("HOLD")))))

;; Custom TODO keyword faces
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "#e0cf9f" :background "skyblue4" :weight bold)
              ("NEXT" :foreground "yellow" :weight bold)
              ("CODE3" :foreground "#ff0404" :background "#3d0a17" :weight bold)
              ("BLOCKED" :foreground "#c0ffee" :background "#1d196a" :weight bold)
              ("DELG" :foreground "#f9b2a9" :background "#1d196a" :weight bold)
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

;; Always split side-by-side
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; Clock entries
(setq org-clock-into-drawer t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Roboto Mono for Powerline" :foundry "pyrs" :slant normal :weight normal :height 181 :width normal)))))

;;(custom-set-faces
;; '(default ((t (:family "Ubuntu Mono derivative Powerline" :foundry "DAMA" :slant normal :weight normal :height 203 :width normal)))))

(setq-default fill-column 72)
