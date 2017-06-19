;; Set up the MELPA repository.
;; http://melpa.org/#/getting-started
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)


;; Add Vim keybindings to Emacs, but don't enable by default.
(require 'evil)


;; Set the lisp system and, optionally, some contribs.
;; https://github.com/slime/slime#quick-setup-instructions
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))


;; Add the Zenburn theme for Emacs
;; https://github.com/bbatsov/zenburn-emacs
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("4528fb576178303ee89888e8126449341d463001cb38abe0015541eb798d8a23" default)))
 '(package-selected-packages (quote (evil slime))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
