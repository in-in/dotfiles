(require 'package)

(setq package-archives '(
  ("melpa-stable" . "https://stable.melpa.org/packages/")
  ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(use-package))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path (concat user-emacs-directory "config"))

(load "use_package.el")
(load "settings.el")
