;; use-package
(setq use-package-always-ensure t)

(eval-when-compile
  (require 'use-package))

;; (use-package dracula-theme)

(use-package doom-themes
  :init (load-theme 'doom-vibrant t))

(use-package flycheck
  :init (global-flycheck-mode))
