(require 'package)

(add-to-list 'package-archives
  '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;; get the latest versions of all packages
(when (not package-archive-contents)
  (package-refresh-contents))

;; the packages you want installed
(defvar my-packages
  '(use-package))

;; install packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; add users files
(add-to-list 'load-path
  (concat user-emacs-directory
    (convert-standard-filename "custom/"))
  )

(load "use_package.el")
(load "custom.el")
(load "ui.el")
(load "orgy.el")

;; load dired-x
(require 'dired-x)

;; enable ido everywhere
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
