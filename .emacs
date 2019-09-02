;; ============================================================================
;; Daniel's Emacs configuration of wonder
;; ============================================================================


;; Disable the splash screen.
(setq inhibit-splash-screen t
      initial-scratch-message nil)

;; Hide the tool bar and scroll bars.
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Make typing `y` or `n` acceptable when prompted for `yes` or `no`.
(defalias 'yes-or-no-p 'y-or-n-p)





;; Package management
;; ============================================================================

;; [1] - Add MELPA.
;; [2] - Add Org ELPA (for `org-mode`).
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")) ;; [1]
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t) ;; [2]
(setq inferior-lisp-program (executable-find "sbcl"))





;; Reading
;; ============================================================================

;; Enable column numbers.
(setq column-number-mode t)



;; Editing
;; ============================================================================

;; Enable Emacs to access the system clipboard.
(setq x-select-enable-clipboard t)

;; Disable back up files.
(setq make-backup-files nil)

(show-paren-mode t)





;; org-mode
;; ============================================================================

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Tell org-mode what files should be searched for agenda items.
(setq org-agenda-files (list "~/org/todo.org"))





;; Do not touch
;; ============================================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (slime org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
