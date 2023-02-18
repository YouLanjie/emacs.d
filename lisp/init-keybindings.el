;;; init-keybindings.el -- 设置emcas的按键设置
;;; Commentary:
;;; Code:

(define-key evil-normal-state-map
  (kbd "C-j")
  (lambda ()
    (interactive)
    (forward-line 20)))
(define-key evil-normal-state-map
  (kbd "C-k")
  (lambda ()
    (interactive)
    (forward-line -20)))

(provide 'init-keybindings)

;;; init-keybindings.el ends here
