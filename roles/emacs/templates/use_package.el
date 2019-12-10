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
  :init (load-theme 'doom-vibrant t)
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

(use-package
  smartparens
  :custom ((smartparens-global-mode t)))

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
