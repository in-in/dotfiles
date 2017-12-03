; (require 'package)

; (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
;                     (not (gnutls-available-p))))
;        (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
;   (add-to-list 'package-archives (cons "melpa" url) t))
; 
; (package-initialize)

(load "~/.emacs.d/init-packages")

;; Load dired-x
(require 'dired-x)

(tool-bar-mode -1) ;; hide toolbar
(menu-bar-mode -1) ;; hide menu-bar

;; disable backup/autosave files
(setq make-backup-files nil) ;; don't want any backup files
(setq auto-save-list-file-name nil) ;; don't want any .saves files
(setq auto-save-default nil) ;; don't want any auto saving

(setq ring-bell-function 'ignore) ;; turn off sound signal

(load-theme 'tsdh-dark t) ;; load theme

;; Start window size
(when window-system (set-frame-size (selected-frame) 130 40))
(add-to-list 'default-frame-alist '(width . 130))
(add-to-list 'default-frame-alist '(height . 40))

(set-default-font "Hack-14") ;; set font
(size-indication-mode t) ;; file size in mode-line

;; Inhibit startup/splash screen
(setq inhibit-splash-screen t)
(setq ingibit-startup-message t)

;; End of file newlines
(setq require-final-newline t)

;; Enable Ido Everywhere
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Enable convert the region to upper case and to lower case
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
