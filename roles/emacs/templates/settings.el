(custom-set-variables
 '(auto-save-default nil)
 '(auto-save-list-file-prefix nil)
 '(calendar-date-style (quote european))
 '(calendar-week-start-day 1)
 '(column-number-mode t)
 '(confirm-nonexistent-file-or-buffer nil)
 '(cua-mode t nil (cua-base))
 '(current-language-environment "UTF-8")
 '(cursor-type (quote bar))
 '(delete-selection-mode t)
 '(desktop-auto-save-timeout nil)
 '(desktop-files-not-to-save "")
 '(desktop-load-locked-desktop t)
 '(desktop-restore-eager 1)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(epa-pinentry-mode (quote loopback))
 '(fill-column 90)
 '(global-hl-line-mode t)
 '(global-visual-line-mode t)
 '(global-whitespace-mode t)
 '(indent-tabs-mode t)
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
 '(kill-whole-line t)
 '(line-spacing 2)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(ring-bell-function (quote ignore))
 '(scroll-bar-mode nil)
 '(split-height-threshold nil)
 '(split-width-threshold 80)
 '(standard-indent 2)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(whitespace-global-modes (quote (not org-mode)))
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
							 :width normal)))))

(set-window-scroll-bars (minibuffer-window) nil)
(setq-default frame-title-format '("%b - %F"))
(setq whitespace-indentation 'whitespace-tab)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(defun display-startup-echo-area-message () (message ""))

(defun duplicate-line ()
	(interactive)
	(save-mark-and-excursion
		(beginning-of-line)
		(insert (thing-at-point 'line t))))

(global-set-key (kbd "C-S-d") 'duplicate-line)

(defun move-line-down ()
	(interactive)
	(let ((col (current-column)))
		(save-excursion (forward-line) (transpose-lines 1))
		(forward-line)
		(move-to-column col)))

(defun move-line-up ()
	(interactive)
	(let ((col (current-column)))
		(save-excursion (forward-line) (transpose-lines -1))
		(forward-line -1)
		(move-to-column col)))

(global-set-key (kbd "C-S-j") 'move-line-down)
(global-set-key (kbd "C-S-k") 'move-line-up)
