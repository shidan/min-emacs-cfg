;; builtin modes keybindings

(global-set-key (kbd "C-x M-f") 'ffap)

;; edit as sudo

(global-set-key (kbd "C-x M-s") 'edit-current-file-as-root)

;; smex hotkeys

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; ibuffer

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; recentf

(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; neotree

(global-set-key (kbd "<f8>") 'neotree-toggle)

;; popwin

(global-set-key (kbd "C-z") popwin:keymap)

;; multiple-cursors

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; magit

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; magic words

(provide 'init_hotkeys)
