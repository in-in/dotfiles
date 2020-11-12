(require 'package)

(setq package-archives
			'(("gnu" . "https://elpa.gnu.org/packages/")
				("melpa" . "https://melpa.org/packages/")
				("org" . "https://orgmode.org/elpa/")))

(setq package-archive-priorities
			'(("org" . 40) ("melpa" . 30) ("gnu" . 20)))

(package-initialize)

(when (not package-archive-contents) (package-refresh-contents))

(defvar my-packages '(use-package))

(dolist (p my-packages)
	(when (not (package-installed-p p)) (package-install p)))

(load (concat user-emacs-directory "use_package.el"))
(load (concat user-emacs-directory "settings.el"))
