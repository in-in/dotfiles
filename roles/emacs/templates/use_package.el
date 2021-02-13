(setq use-package-always-ensure t)
(setq storage-dir "{{ user_storage }}/")

(eval-when-compile (require 'use-package))

(use-package
	emacs
	:custom-face (link ((t (:underline nil)))))

; https://github.com/emacscollective/no-littering
(use-package
	no-littering
	:config (setq custom-file
								(no-littering-expand-etc-file-name "custom.el")))

(use-package
	doom-themes
	:config (setq doom-themes-enable-bold
								t
								doom-themes-enable-italic
								t)
	(load-theme 'doom-spacegrey t)
	(doom-themes-org-config))

(use-package
	whitespace
	:custom (global-whitespace-mode t)
	(whitespace-global-modes '(not org-mode))
	(whitespace-line nil)
	(whitespace-line-column nil)
	(whitespace-style
	 (quote
		(empty
		 face
		 indentation
		 lines
		 space-mark
		 spaces
		 tab-mark
		 tabs
		 trailing)))
	:custom-face (whitespace-empty ((t (:background nil))))
	(whitespace-hspace ((t (:background nil))))
	(whitespace-indentation ((t (:background nil))))
	(whitespace-line ((t (:background nil))))
	(whitespace-tab ((t (:background nil))))
	(whitespace-space ((t (:background nil)))))

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
	(org-babel-load-languages '((shell . t)))
	(org-capture-bookmark nil)
	(org-capture-templates
	 (quote
		(("b"
			"new book"
			entry
			(file "books.org")
			(file "templates/tmp_books.org"))
		 ("d"
			"diary"
			entry
			(file+olp+datetree "diary.org.gpg")
			"* %<%H:%M>\n%?"
			:immediate-finish t
			:empty-lines 1))))
	(org-confirm-babel-evaluate nil)
	(org-default-notes-file "notes.org")
	(org-enforce-todo-checkbox-dependencies t)
	(org-enforce-todo-dependencies t)
	(org-fontify-done-headline t)
	(org-hide-block-startup t)
	(org-hide-emphasis-markers t)
	(org-indent-boundary-char 65279)
	(org-indent-indentation-per-level 1)
	(org-log-note-headings nil)
	(org-outline-path-complete-in-steps nil)
	(org-refile-targets '((org-agenda-files :maxlevel . 1)))
	(org-refile-use-outline-path 'file)
	(org-special-ctrl-a/e t)
	(org-src-tab-acts-natively t)
	(org-startup-align-all-tables t)
	(org-startup-indented t)
	(org-startup-truncated nil)
	(org-todo-keywords '((sequence "TODO(t!)" "DONE(d!)")))
	:custom-face (org-level-1 ((t (:inherit outline-1 :weight normal))))
	(org-level-2 ((t (:inherit outline-2 :weight normal))))
	(org-level-3 ((t (:inherit outline-3 :weight normal))))
	(org-level-4 ((t (:inherit outline-4 :weight normal))))
	(org-level-5 ((t (:inherit outline-5 :weight normal))))
	(org-level-6 ((t (:inherit outline-6 :weight normal))))
	(org-level-7 ((t (:inherit outline-7 :weight normal))))
	(org-level-8 ((t (:inherit outline-8 :weight normal))))
	(org-link ((t (:inherit link :weight normal))))
	:bind (("C-c a" . org-agenda)
				 ("<f6>" . org-capture)
				 :map org-mode-map
				 ("<M-S-return>" . org-insert-subheading)
				 ("C-k" . org-kill-line)))

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
	(counsel-mode 1)
	:bind (("C-s" . swiper) ("C-:" . avy-goto-char-timer))
	:custom (ivy-count-format "%d/%d ")
	:custom-face (ivy-current-match
								((t (:extend nil :background nil :inverse-video t)))))

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
	:custom (doom-modeline-buffer-encoding nil)
	(doom-modeline-buffer-state-icon nil)
	(doom-modeline-height 24)
	(doom-modeline-icon nil))

; https://github.com/Fuco1/smartparens
(use-package
	smartparens
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
				 ("C-|" . mc/mark-all-like-this)))

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

(use-package
	flyspell
	:defer t
	:config (setq ispell-hunspell-dictionary-alist
								ispell-local-dictionary-alist)
	:hook ((text-mode . flyspell-mode)
				 (prog-mode . flyspell-prog-mode)
				 (org-mode . flyspell-mode))
	:custom ((flyspell-sort-corrections t)
					 (flyspell-issue-message-flag nil)
					 (ispell-local-dictionary "en_US")
					 (ispell-local-dictionary-alist
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
					 (ispell-program-name (executable-find "hunspell"))))

; https://github.com/org-roam/org-roam
(use-package
	org-roam
	:after org
	:init (let ((dir (concat org-directory "roam")))
					(unless (file-directory-p dir) (make-directory dir)))
	:hook (after-init . org-roam-mode)
	:custom (org-roam-directory (concat org-directory "roam"))
	(org-roam-db-update-method 'immediate)
	(org-roam-completion-system 'ivy)
	(org-roam-capture-templates
	 '(("d"
			"default"
			plain
			#'org-roam-capture--get-point
			"%?"
			:file-name "%<%Y%m%d%H%M%S>"
			:head "#+TITLE: ${title}\n#+CREATED: %u\n"
			:unnarrowed t
			:immediate-finish t)))
	:bind (:map org-roam-mode-map
							(("C-c n l" . org-roam)
							 ("C-c n f" . org-roam-find-file)
							 ("C-c n t" . org-roam-tag-add))
							:map org-mode-map
							(("C-c n i" . org-roam-insert))
							(("C-c n I" . org-roam-insert-immediate))))

; https://github.com/org-roam/org-roam-server
(use-package
	org-roam-server
	:custom (org-roam-server-port 1515))

; https://github.com/justbur/emacs-which-key
(use-package
	which-key
	:init (which-key-mode)
	:custom (which-key-compute-remaps t)
	(which-key-idle-delay 2.0)
	(which-key-idle-secondary-delay 0.1)
	(which-key-is-verbose t)
	(which-key-show-remaining-keys t))
