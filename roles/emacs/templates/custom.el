;; toggle line number in all buffers
(global-linum-mode 1)

;; set line spacing
(setq-default line-spacing 0.3)

;; don't want any backup files
(setq make-backup-files nil)

;; don't want any .saves files
(setq auto-save-list-file-name nil)

;; don't want any auto saving
(setq auto-save-default nil)

;; turn off sound signal
(setq ring-bell-function 'ignore)

;; stop adding "Custom" fields to the end of my .init file
(setq custom-file (concat user-emacs-directory "customize.el"))

;; set font
(set-default-font "{{ user_font_monospace }} Medium-13")

;; file size in mode-line
(size-indication-mode t)

;; end of file newlines
(setq require-final-newline t)

;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
