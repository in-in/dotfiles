(custom-set-variables
  '(auto-save-default nil)
  '(auto-save-list-file-prefix nil)
  '(calendar-week-start-day 1)
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
  '(org-bullets-bullet-list (quote ("○" "◐" "◑" "◒" "◓")))
  '(org-log-done (quote time))
  '(org-log-note-headings (quote ((reschedule . "Rescheduled from %S to %s"))))
  '(org-log-reschedule (quote time))
  '(ring-bell-function (quote ignore))
  '(tool-bar-mode nil))

(custom-set-faces
  '(default
    ((t
      (:family "Iosevka Term SS08"
        :foundry "CYEL"
        :height 130
        :slant normal
        :weight normal
        :width normal)))))

(set-window-scroll-bars (minibuffer-window) nil)

(defun display-startup-echo-area-message ()
  (message ""))

