(setq use-package-always-ensure t)
(setq storage-dir "~/storage/")

(eval-when-compile
  (require 'use-package)
)

(use-package doom-themes
  :init
  (load-theme 'doom-vibrant t)
  (doom-themes-org-config)
)

(use-package org
  :init
  (org-mode)
  :custom
  (org-directory (concat storage-dir "org"))
  :bind
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture)
)

(use-package which-key
  :init
  (which-key-mode)
)

(use-package reverse-im
  :config
  (reverse-im-activate "russian-computer")
)

(use-package flyspell
  :hook
  (text-mode . flyspell-mode)
  (prog-mode . flyspell-prog-mode)
)

(use-package guess-language
  :hook ((text-mode org-mode) . guess-language-mode)
)

(use-package elfeed
  :config
  (defun elfeed-search-format-date (date)
    (format-time-string "%y.%m.%d %H:%M" (seconds-to-time date)))

  (add-hook 'elfeed-new-entry-hook
    (elfeed-make-tagger :feed-url "youtube\\.com"
      :add '(youtube)))

  (defun my-elfeed-tag-sort (a b)
    (let*
      ((a-tags
        (format "%s" (elfeed-entry-tags a)))
      (b-tags
        (format "%s" (elfeed-entry-tags b))))
      (if (string= a-tags b-tags) (< (elfeed-entry-date b)
        (elfeed-entry-date a))) (string< a-tags b-tags)))

  :bind
  ("C-x w" . elfeed)
  (:map elfeed-show-mode-map
    ("q" . #'delete-window))

  :custom
  (elfeed-enclosure-default-dir (concat storage-dir "podcast/"))
  (elfeed-search-sort-function #'my-elfeed-tag-sort)
  (elfeed-search-title-min-width 80)
  (elfeed-show-entry-switch #'pop-to-buffer)
)

(use-package elfeed-org
  :requires org
  :config
  (elfeed-org)
  :custom
  (rmh-elfeed-org-files (list (concat org-directory "/elfeed.org")))
)
