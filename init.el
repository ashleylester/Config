(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(defvar my-packages '(better-defaults
                      projectile
                      clojure-mode
                      cider
                      ess
                      magit
                      ample-theme
                      ace-window))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(global-linum-mode t)
(set-default-font "Crisp-12")
(load-theme 'ample t t)
(enable-theme 'ample)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(mouse-wheel-progressive-speed nil)

(add-to-list 'load-path "c:/Users/ashley.lester/.emacs.d/lisp") ;non-elpa package dir
(require 'powerline) ;install this manually
(powerline-default-theme)

(global-set-key (kbd "M-\\") 'ace-window)

(defun set-window-width (n)
  "Set the selected window's width."
  (adjust-window-trailing-edge (selected-window) (- n (window-width)) t))

(defun set-100-columns()
  (interactive)
  (set-window-width 100))

(global-set-key (kbd "\C-x ~") 'set-100-columns)
