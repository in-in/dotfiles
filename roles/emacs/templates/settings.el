(set-window-scroll-bars (minibuffer-window) nil)
(setq-default frame-title-format '("%b - %F"))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(defun display-startup-echo-area-message () (message ""))

(defun duplicate-line ()
	(interactive)
	(save-mark-and-excursion
		(beginning-of-line)
		(insert (thing-at-point 'line t))))

(global-set-key (kbd "C-S-d") 'duplicate-line)
(global-set-key (kbd "<f9>") 'sort-lines)

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

(custom-set-variables
 '(auto-save-default nil)
 '(auto-save-list-file-prefix nil)
 '(calendar-date-style 'european)
 '(calendar-week-start-day 1)
 '(column-number-mode t)
 '(confirm-nonexistent-file-or-buffer nil)
 '(current-language-environment "UTF-8")
 '(cursor-type 'bar)
 '(default-frame-alist
		'((width . 0.7) (height . 0.9) (left . 0.5) (top . 0.5)))
 '(delete-selection-mode t)
 '(epa-pinentry-mode 'loopback)
 '(fill-column 90)
 '(global-hl-line-mode t)
 '(global-visual-line-mode t)
 '(indent-tabs-mode t)
 '(inhibit-startup-screen t)
 '(kill-whole-line t)
 '(line-spacing 2)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(ring-bell-function 'ignore)
 '(scroll-bar-mode nil)
 '(split-height-threshold nil)
 '(split-width-threshold 80)
 '(standard-indent 2)
 '(tab-width 2)
 '(tool-bar-mode nil))

(custom-set-faces
 '(default
		((t
			(:family "{{ user_font_monospace }}"
							 :foundry "CYEL"
							 :height 130
							 :slant normal
							 :weight normal
							 :width normal)))))
