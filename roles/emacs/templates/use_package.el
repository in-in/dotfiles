(setq use-package-always-ensure t)
(setq storage-dir "~/storage/")

(eval-when-compile (require 'use-package))

(use-package
  doom-themes
  :init (load-theme 'doom-vibrant t)
  (doom-themes-org-config))

(use-package
  reverse-im
  :config (reverse-im-activate "russian-computer"))

(use-package
  flyspell
  :hook ((text-mode . flyspell-mode) (prog-mode . flyspell-prog-mode))
  :custom (flyspell-sort-corrections t))

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

(use-package which-key :init (which-key-mode))

(use-package
  elfeed
  :config (defun elfeed-search-format-date (date)
            (format-time-string "%y.%m.%d %H:%M" (seconds-to-time date)))
  (defun my-elfeed-tag-sort (a b)
    (let* ((a-tags (format "%s" (elfeed-entry-tags a)))
           (b-tags (format "%s" (elfeed-entry-tags b))))
      (if (string= a-tags b-tags)
          (< (elfeed-entry-date b) (elfeed-entry-date a)))
      (string< a-tags b-tags)))
  (defun custom-elfeed-show-enclosure-filename (entry url-enclosure)
    (let* ((title (elfeed-entry-title entry))
           (feed (elfeed-entry-feed entry))
           (feed-title (elfeed-meta feed :title))
           (ext (file-name-extension
                 (url-unhex-string
                  (car (url-path-and-query (url-generic-parse-url url-enclosure)))))))
      (replace-regexp-in-string
       " "
       "_"
       (format "%s - %.60s.%s" feed-title title ext))))
  :bind ("C-x w" . elfeed)
  (:map elfeed-show-mode-map ("q" . #'delete-window))
  :custom (elfeed-enclosure-default-dir (concat storage-dir "podcast/"))
  (elfeed-search-filter "@2-week-ago +unread")
  (elfeed-search-sort-function #'my-elfeed-tag-sort)
  (elfeed-search-title-min-width 80)
  (elfeed-search-title-max-width 80)
  (elfeed-show-enclosure-filename-function
   #'custom-elfeed-show-enclosure-filename)
  (elfeed-show-entry-switch #'pop-to-buffer))

(use-package
  elfeed-org
  :config (elfeed-org)
  :custom (rmh-elfeed-org-files (list (concat org-directory "/elfeed.org"))))

(use-package
  lispy
  :hook (emacs-lisp-mode . (lambda () (lispy-mode 1)))
  :custom (lispy-multiline-threshold 70))

