(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

; list the packages you want
; (setq package-list '(org))
; (setq my-package-list '(org))
; (mapc #'package-install my-package-list)

; activate all the packages
(package-initialize)

; fetch the list of packages available 
; (unless package-archive-contents
;   (package-refresh-contents))

; install the missing packages
; (dolist (package package-list)
;   (unless (package-installed-p package)
;     (package-install package)))

(setq my-package-list '(org))
(mapc #'package-install my-package-list)
