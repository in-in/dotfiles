(package-initialize)

(tool-bar-mode -1) ;; hide toolbar

(setq make-backup-files nil) ;; don't want any backup files
(setq auto-save-list-file-name nil) ;; don't want any .saves files
(setq auto-save-default nil) ;; don't want any auto saving

(load-theme 'tsdh-dark t) ;; load theme

(set-default-font "Hack-11") ;; set font
