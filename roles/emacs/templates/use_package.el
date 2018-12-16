(setq use-package-always-ensure t)
(setq storage-dir "{{ user_storage }}/")

(eval-when-compile (require 'use-package))

(use-package diminish)

(use-package
  doom-themes
  :pin melpa
  :init (load-theme 'doom-vibrant t)
  :config (doom-themes-org-config))

(use-package
  reverse-im
  :config (reverse-im-activate "russian-computer"))

(use-package
  flyspell
  :defer t
  :config (setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist)
  :hook ((text-mode . flyspell-mode) (prog-mode . flyspell-prog-mode))
  :custom (flyspell-sort-corrections t)
  (flyspell-issue-message-flag nil))

(use-package
  guess-language
  :hook (text-mode . guess-language-mode)
  :custom (guess-language-langcodes
           (quote ((en "en_US" "English") (ru "ru_RU" "Russian"))))
  (guess-language-languages (quote (en ru)))
  (guess-language-min-paragraph-length 30))

(use-package
  org
  :custom (org-directory (concat storage-dir "org"))
  :bind ("C-c a" . org-agenda)
  ("C-c c" . org-capture))

(use-package
  which-key
  :config (which-key-mode)
  :diminish which-key-mode
  :custom (which-key-sort-order (quote which-key-description-order)))

(use-package
  lispy
  :hook (emacs-lisp-mode . (lambda () (lispy-mode 1)))
  :custom (lispy-multiline-threshold 70))

(use-package
  rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package
  ivy
  :defer t
  :diminish ivy-mode
  :init (ivy-mode 1)
  :bind (("C-s" . swiper) ("C-:" . avy-goto-char-timer))
  :custom (ivy-count-format "%d/%d "))

(use-package company :hook (after-init . global-company-mode))
