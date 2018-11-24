(custom-set-variables
  '(auto-save-default nil)
  '(auto-save-list-file-prefix nil)
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

