;; popwin

(require 'popwin)
(popwin-mode 1)
(push '("*Open Recent*" :height 20 :position bottom-only) popwin:special-display-config)

;; nlinum

(setq nlinum-format " %d ")
(global-nlinum-mode t)
(add-hook 'recentf-dialog-mode-hook (lambda () (nlinum-mode -1)))
(add-hook 'help-mode-hook (lambda () (nlinum-mode -1)))
(add-hook 'dired-mode-hook (lambda () (nlinum-mode -1)))

;; neotree

(setq neo-theme 'ascii)
(setq neo-window-position 'right)
(setq neo-window-width 35)
(setq neo-window-fixed-size t)
(add-hook 'neotree-mode-hook (lambda () (nlinum-mode -1)))
(setq neo-smart-open t)
(setq-default neo-persist-show t)
(when neo-persist-show
  (add-hook 'popwin:before-popup-hook (lambda () (setq neo-persist-show nil)))
  (add-hook 'popwin:after-popup-hook (lambda () (setq neo-persist-show t))))


;; projectile

(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-keymap-prefix (kbd "C-c C-p"))
(setq projectile-switch-project-action 'neotree-projectile-action)

;; ibuffer

(autoload 'ibuffer "ibuffer" "List buffers." t)

;; ibuffer-projectile

(add-hook 'ibuffer-hook
	  (lambda ()
	    (ibuffer-projectile-generate-filter-groups)
	    (unless (eq ibuffer-sorting-mode 'alphabetic)
	      (ibuffer-do-sort-by-alphabetic))))

;; recentf

(recentf-mode t)
(setq recent-max-menu-items 75)
(run-at-time nil (* 5 60) 'recentf-save-list)

;; tramp

(setq tramp-default-method "ssh")

;; ido and extra packages (ido-ubiquitous, flx-ido)

(ido-mode t)
(setq ido-use-filename-at-point 'guess)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-ubiquitous-mode t)
(flx-ido-mode t)

;; smex

(smex-initialize)

;; anaconda mode

(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; company-mode

(add-hook 'after-init-hook 'global-company-mode)
(company-quickhelp-mode t)
(setq company-quickhelp-delay nil)
(eval-after-load 'company
  '(define-key company-active-map (kbd "M-h") #'company-quickhelp-manual-begin))
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-anaconda))

;; smart-mode-line

(setq sml/theme 'respectful)
(setq sml/no-confirm-load-theme t)
(sml/setup)

;; smartparents

(require 'smartparens-config)
(add-hook 'python-mode-hook #'smartparens-mode)
(add-hook 'elisp-mode-hook #'smartparens-mode)

;; multiple-cursors
(require 'multiple-cursors)

;; magic words

(provide 'init_packages)
