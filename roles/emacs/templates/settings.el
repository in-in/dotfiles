(custom-set-variables
 '(auto-save-default nil)
 '(auto-save-list-file-prefix nil)
 '(calendar-date-style (quote european))
 '(calendar-week-start-day 1)
 '(confirm-nonexistent-file-or-buffer nil)
 '(current-language-environment "UTF-8")
 '(cursor-type (quote bar))
 '(custom-file (concat user-emacs-directory "customize.el"))
 '(desktop-files-not-to-save "")
 '(desktop-path (list user-emacs-directory))
 '(desktop-restore-eager 1)
 '(desktop-save-mode t)
 '(global-linum-mode t)
 '(global-whitespace-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ispell-local-dictionary "en_US")
 '(ispell-local-dictionary-alist
   (quote
    (("en_US"
      "[[:alpha:]]"
      "[^[:alpha:]]"
      "[']"
      nil
      ("-d" "en_US")
      nil
      utf-8)
     ("ru_RU"
      "[[:alpha:]]"
      "[^[:alpha:]]"
      "[']"
      nil
      ("-d" "ru_RU")
      nil
      utf-8))))
 '(ispell-program-name (executable-find "hunspell"))
 '(line-spacing 2)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-agenda-files (list org-directory))
 '(org-agenda-start-on-weekday 1)
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-indent-boundary-char 65279)
 '(org-indent-indentation-per-level 1)
 '(org-log-into-drawer t)
 '(org-log-reschedule (quote note))
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 1))))
 '(org-refile-use-outline-path (quote file))
 '(org-special-ctrl-a/e t)
 '(org-startup-indented t)
 '(org-startup-truncated nil)
 '(org-todo-keywords (quote ((sequence "TODO(t!)" "DONE(d!)"))))
 '(ring-bell-function (quote ignore))
 '(scroll-bar-mode nil)
 '(standard-indent 2)
 '(tool-bar-mode nil)
 '(whitespace-line nil)
 '(whitespace-line-column nil)
 '(whitespace-style
   (quote
    (face
     trailing
     tabs
     spaces
     lines
     newline
     empty
     indentation
     space-after-tab
     space-before-tab
     space-mark
     tab-mark))))

(custom-set-faces
 '(default
    ((t
      (:family "{{ user_font_monospace }}"
               :foundry "CYEL"
               :height 130
               :slant normal
               :weight normal
               :width normal))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.0 :weight normal))))
 '(org-level-2 ((t (:inherit outline-2 :weight normal))))
 '(org-level-3 ((t (:inherit outline-3 :weight normal))))
 '(org-level-4 ((t (:inherit outline-4 :weight normal))))
 '(org-level-5 ((t (:inherit outline-5 :weight normal))))
 '(org-level-6 ((t (:inherit outline-6 :weight normal))))
 '(org-level-7 ((t (:inherit outline-7 :weight normal))))
 '(org-level-8 ((t (:inherit outline-8 :weight normal))))
 '(org-link ((t (:inherit link :weight normal)))))

(set-window-scroll-bars (minibuffer-window) nil)
(setq-default frame-title-format '("%F"))

(defun display-startup-echo-area-message () (message ""))
