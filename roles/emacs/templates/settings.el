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
        :weight normal
        :width normal)))))

(set-window-scroll-bars (minibuffer-window) nil)

(defun display-startup-echo-area-message ()
  (message ""))

