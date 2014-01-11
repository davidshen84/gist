;; -*- Emacs-Lisp -*-

(dolist (p '("~/.emacs.d"
             ;"~/.emacs.d/color-theme"
             "~/.emacs.d/auto-complete"
             "~/.emacs.d/org/lisp"))
  (add-to-list 'load-path p))

; load theme
(load-theme 'deeper-blue 1)

;; some basic default settings
(progn
  ;; set tab mode
  (setq-default  tab-width 4
                 indent-tabs-mode nil
                 indent-line-function 'insert-tab)
  ;; bind goto line function with Ctrl-c-g
  (global-set-key (kbd "C-c g") 'goto-line)
  (global-set-key (kbd "C-c l") 'linum-mode)
  (global-set-key (kbd "C-c b") 'whitespace-mode))

; load ac
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; load highlight indentation
(require 'highlight-indentation)

;; load orgmod
(require 'org-install)

(defun dev-basic ()
  (linum-mode t)
  (highlight-indentation-mode))

;; for shell script
(add-hook 'sh-mode-hook
          '(lambda ()
             (dev-basic)
             (setq sh-basic-offset 2)))

;; for elisp
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (dev-basic)))

;; for python
(add-hook 'python-mode-hook
          '(lambda ()
             (dev-basic)
             (setq python-indent 2)))

;; for js
(add-hook 'js-mode
          '(lambda ()
             (dev-basic)))


;; for orgmod
(add-hook 'org-mode-hook
          '(lambda ()
             (auto-fill-mode t)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "courier" :foundry "adobe" :slant normal :weight normal :height 180 :width normal)))))

