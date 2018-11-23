;; use-package
(setq use-package-always-ensure t)

(eval-when-compile
  (require 'use-package))

(use-package doom-themes
  :init
  (load-theme 'doom-vibrant t)
  (doom-themes-org-config))

(use-package org
  :ensure org-plus-contrib
  :config
  (setq-default org-startup-indented t)
  (setq-default org-startup-truncated nil))

(use-package which-key
  :init
  (which-key-mode))
