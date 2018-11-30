(custom-set-variables
  '(auto-save-default nil)
  '(auto-save-list-file-prefix nil)
  '(calendar-week-start-day 1)
  '(confirm-nonexistent-file-or-buffer nil)
  '(current-language-environment "UTF-8")
  '(cursor-type (quote bar))
  '(custom-file (concat user-emacs-directory "customize.el"))
  '(desktop-path (user-emacs-directory))
  '(desktop-restore-eager 1)
  '(desktop-save-mode t)
  '(global-linum-mode t)
  '(inhibit-startup-screen t)
  '(line-spacing 2)
  '(make-backup-files nil)
  '(menu-bar-mode nil)
  '(org-agenda-files (list "~/storage/org"))
  '(org-agenda-start-on-weekday 1)
  '(org-default-notes-file "~/storage/org/notes.org")
  '(org-log-into-drawer t)
  '(org-log-reschedule (quote note))
  '(org-special-ctrl-a/e t)
  '(org-todo-keywords (quote ((sequence "TODO(t!)" "DONE(d!)"))))
  '(ring-bell-function (quote ignore))
  '(scroll-bar-mode nil)
  '(tool-bar-mode nil))

(custom-set-faces
  '(default
    ((t
      (:family "Iosevka Term SS08"
        :foundry "CYEL"
        :height 130
        :slant normal
        :weight normal
        :width normal))))
  '(org-level-1
    ((t
      (:inherit outline-1
        :height 1.0
        :weight normal))))
  '(org-level-2 ((t (:inherit outline-2 :weight normal))))
  '(org-level-3 ((t (:inherit outline-3 :weight normal))))
  '(org-level-4 ((t (:inherit outline-4 :weight normal))))
  '(org-level-5 ((t (:inherit outline-5 :weight normal))))
  '(org-level-6 ((t (:inherit outline-6 :weight normal))))
  '(org-level-7 ((t (:inherit outline-7 :weight normal))))
  '(org-level-8 ((t (:inherit outline-8 :weight normal))))
  )

(set-window-scroll-bars (minibuffer-window) nil)

(defun display-startup-echo-area-message ()
  (message ""))

