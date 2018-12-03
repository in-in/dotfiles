(setq use-package-always-ensure t)

(eval-when-compile
  (require 'use-package))

(use-package doom-themes
  :init
  (load-theme 'doom-vibrant t)
  (doom-themes-org-config))

(use-package org
  :config
  (setq-default org-startup-indented t)
  (setq-default org-startup-truncated nil)
  :bind
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture))

(use-package which-key
  :init
  (which-key-mode))

(use-package reverse-im
  :config
  (reverse-im-activate "russian-computer"))

(use-package flyspell
  :hook ((prog-mode . flyspell-mode)
         (text-mode . flyspell-prog-mode)))

(use-package guess-language
  :hook ((text-mode org-mode) . guess-language-mode)
  :config
  (setq guess-language-langcodes '((en . ("en_US" "English"))
                                   (ru . ("ru_RU" "Russian"))))
  (setq guess-language-languages '(en ru))
)
