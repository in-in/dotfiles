(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")))

(setq package-archive-priorities
      '(("org" . 40) ("melpa" . 30) ("melpa-stable" . 20) ("gnu" . 10)))

(package-initialize)

(when (not package-archive-contents) (package-refresh-contents))

(defvar my-packages '(use-package))

(dolist (p my-packages)
  (when (not (package-installed-p p)) (package-install p)))

(add-to-list 'load-path (concat user-emacs-directory "config"))

(load "use_package.el")
(load "settings.el")
