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

(defun move-line-up ()
	"Move up the current line."
	(interactive)
	(transpose-lines 1)
	(forward-line -2)
	(indent-according-to-mode))

(defun move-line-down ()
	"Move down the current line."
	(interactive)
	(forward-line 1)
	(transpose-lines 1)
	(forward-line -1)
	(indent-according-to-mode))

(global-set-key (kbd "<M-up>") 'move-line-up)
(global-set-key (kbd "<M-down>") 'move-line-down)

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
 '(global-hl-line-mode nil)
 '(global-visual-line-mode t)
 '(indent-tabs-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
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
