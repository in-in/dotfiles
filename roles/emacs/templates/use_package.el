(setq use-package-always-ensure t)

(eval-when-compile
  (require 'use-package)
)

(use-package doom-themes
  :init
  (load-theme 'doom-vibrant t)
  (doom-themes-org-config)
)

(use-package org
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
  :config
  (add-hook 'text-mode-hook 'flyspell-mode)
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
)

(use-package guess-language
  :hook ((text-mode org-mode) . guess-language-mode)
)
