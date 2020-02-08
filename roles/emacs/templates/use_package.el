(setq use-package-always-ensure t)
(setq storage-dir "{{ user_storage }}/")

(eval-when-compile (require 'use-package))

; https://github.com/emacscollective/no-littering
(use-package
	no-littering
	:config (setq custom-file
								(no-littering-expand-etc-file-name "custom.el")))

(use-package
	doom-themes
	:init (load-theme 'doom-challenger-deep t)
	:config (doom-themes-org-config))

(use-package
	reverse-im
	:config (reverse-im-activate "russian-computer"))

(use-package
	guess-language
	:hook (text-mode . guess-language-mode)
	:custom (guess-language-langcodes
					 (quote ((en "en_US" "English") (ru "ru_RU" "Russian"))))
	(guess-language-languages (quote (en ru)))
	(guess-language-min-paragraph-length 30))

(use-package
	org
	:custom (org-directory (concat storage-dir "org/"))
	(org-agenda-files (list org-directory))
	(org-agenda-start-on-weekday 1)
	(org-babel-load-languages (quote ((shell . t))))
	(org-capture-bookmark nil)
	(org-capture-templates
	 (quote
		(("n"
			"new dotfiles task"
			entry
			(file "dotfiles.org")
			"* TODO %?"
			:prepend t)
		 ("d"
			"diary"
			entry
			(file+olp+datetree "diary.org.gpg")
			"* %<%H:%M>\n%?"
			:empty-lines 1))))
	(org-confirm-babel-evaluate nil)
	(org-default-notes-file "notes.org")
	(org-enforce-todo-checkbox-dependencies t)
	(org-enforce-todo-dependencies t)
	(org-hide-block-startup t)
	(org-hide-emphasis-markers t)
	(org-indent-boundary-char 65279)
	(org-indent-indentation-per-level 1)
	(org-log-note-headings nil)
	(org-outline-path-complete-in-steps nil)
	(org-refile-targets
	 (quote ((org-agenda-files :maxlevel . 1))))
	(org-refile-use-outline-path (quote file))
	(org-special-ctrl-a/e t)
	(org-src-tab-acts-natively t)
	(org-startup-align-all-tables t)
	(org-startup-indented t)
	(org-startup-truncated nil)
	(org-todo-keywords
	 (quote ((sequence "TODO(t!)" "DONE(d!)"))))
	:custom-face (org-level-1 ((t (:inherit outline-1 :weight normal))))
	(org-level-2 ((t (:inherit outline-2 :weight normal))))
	(org-level-3 ((t (:inherit outline-3 :weight normal))))
	(org-level-4 ((t (:inherit outline-4 :weight normal))))
	(org-level-5 ((t (:inherit outline-5 :weight normal))))
	(org-level-6 ((t (:inherit outline-6 :weight normal))))
	(org-level-7 ((t (:inherit outline-7 :weight normal))))
	(org-level-8 ((t (:inherit outline-8 :weight normal))))
	(org-link ((t (:inherit link :weight normal))))
	:bind ("C-c a" . org-agenda)
	("<f6>" . org-capture))

(use-package
	auto-package-update
	:custom (auto-package-update-delete-old-versions t)
	(auto-package-update-prompt-before-update t))

(use-package
	lispy
	:hook (emacs-lisp-mode . (lambda () (lispy-mode 1)))
	:custom (lispy-multiline-threshold 60))

(use-package
	rainbow-delimiters
	:hook (prog-mode . rainbow-delimiters-mode))

(use-package
	ivy
	:defer t
	:init (ivy-mode 1)
	:bind (("C-s" . swiper) ("C-:" . avy-goto-char-timer))
	:custom (ivy-count-format "%d/%d ")
	(ivy-format-function (quote ivy-format-function-arrow)))

; https://github.com/Yevgnen/ivy-rich
(use-package
	ivy-rich
	:after (ivy)
	:config (ivy-rich-mode 1)
	(setcdr
	 (assq t ivy-format-functions-alist)
	 #'ivy-format-function-line))

; https://github.com/raxod502/prescient.el
(use-package
	prescient
	:config (prescient-persist-mode t)
	:custom (prescient-filter-method '(fuzzy initialism regexp)))

(use-package
	ivy-prescient
	:after (prescient ivy)
	:config (ivy-prescient-mode t))

(use-package
	company-prescient
	:after (prescient company)
	:config (company-prescient-mode t))

(use-package
	company
	:hook (after-init . global-company-mode))

(use-package
	helpful
	:bind (("C-h C-d" . helpful-at-point)
				 ("C-h f" . helpful-callable)
				 ("C-h k" . helpful-key)
				 ("C-h v" . helpful-variable)))

(use-package
	doom-modeline
	:defer t
	:hook (after-init . doom-modeline-init)
	:custom (doom-modeline-buffer-state-icon nil)
	(doom-modeline-icon nil)
	(doom-modeline-height 24))

; https://github.com/Fuco1/smartparens
(use-package
	smartparens
	:config (sp-local-pair 'web-mode "{" nil :actions nil)
	:custom (smartparens-global-mode t)
	(smartparens-global-strict-mode t)
	:bind (("C-c s a" . sp-beginning-of-sexp)
				 ("C-c s e" . sp-end-of-sexp)
				 ("C-c s u" . sp-up-sexp)
				 ("C-c s d" . sp-down-sexp)
				 ("C-c s f" . sp-forward-sexp)
				 ("C-c s b" . sp-backward-sexp)
				 ("C-c s p" . sp-previous-sexp)
				 ("C-c s n" . sp-next-sexp)
				 ("C-c s w" . sp-unwrap-sexp)
				 ("C-c s k" . sp-kill-sexp)))

(use-package
	multiple-cursors
	:custom (mc/always-run-for-all t)
	:bind (("C-<" . mc/mark-previous-like-this)
				 ("C->" . mc/mark-next-like-this)
				 ("C-|" . mc/edit-lines)))

(use-package
	ibuffer
	:bind ("C-x C-b" . ibuffer)
	:custom (ibuffer-expert t))

(use-package
	web-mode
	:custom (web-mode-enable-auto-expanding t)
	:mode (("\\html\\'" . web-mode)
				 ("\\.njk\\'" . web-mode)
				 ("\\.scss\\'" . web-mode)
				 ("\\.css\\'" . web-mode)))

; https://github.com/Alexander-Miller/treemacs
(use-package
	treemacs
	:defer t
	:custom (treemacs-follow-mode t)
	(treemacs-git-mode (quote deferred))
	(treemacs-position (quote right))
	(treemacs-width 30)
	(treemacs-filewatch-mode t)
	:bind (:map global-map
							("M-0" . treemacs-select-window)
							("C-x t 1" . treemacs-delete-other-windows)
							("C-x t t" . treemacs)
							("C-x t B" . treemacs-bookmark)
							("C-x t C-t" . treemacs-find-file)
							("C-x t M-t" . treemacs-find-tag)))
