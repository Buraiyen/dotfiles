(setq user-full-name "Brian Nguyen"
      user-mail-address "brian.edison.nguyen@gmail.com")

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(setq display-line-numbers-type 'relative)

(map! :leader
      (:prefix ("=" . "open file")
       :desc "Edit doom config.org" "c" #'(lambda () (interactive) (find-file "~/.doom.d/config.org"))
       :desc "Edit agenda.org" "a" #'(lambda () (interactive) (find-file "~/Documents/journal/agenda.org"))
))

(setq doom-font (font-spec :family "JetBrainsMonoMedium Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(set-frame-parameter (selected-frame) 'alpha '(90 90)) ;;

(beacon-mode 1)
(setq beacon-blink-when-point-moves-vertically 1)
(setq beacon-blink-when-buffer-changes t)
(setq beacon-blink-when-window-scrolls t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
(setq
   dashboard-banner-logo-title "\nKEYBINDINGS\
                                 \nFind file        (SPC .)\
                                 \nEdit Doom Config (SPC = c)\
                                 \nEdit agenda      (SPC = a)"
   dashboard-startup-banner "~/.doom.d/doom-emacs-dash.png"
   dashboard-set-heading-icons t
   dashboard-set-file-icons t
   dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 5)
                          (projects . 5)
                          (registers . 5)))

(after! org
  (setq org-agenda-files '("~/Documents/journal/agenda.org")
      org-journal-dir "~/Documents/journal/"
      org-journal-file-header "#+TITLE: %M %Y"
      org-journal-date-format "%A, %Y-%m-%d"
      org-journal-file-type 'monthly
      org-journal-file-format "%Y-%m.org"
      org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
      )
  ;; Needed to fix tabbing on headers
  (setq org-fold-core-style 'overlays)
)

(global-set-key (kbd "C-c c") '=calendar)

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(require 'neotree)

(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
    (when (not (memq major-mode
                (list 'org-agenda-mode)))
     (rainbow-mode 1))))
(global-rainbow-mode 1 ) ;'
