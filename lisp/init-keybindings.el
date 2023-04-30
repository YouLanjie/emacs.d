;;; init-keybindings.el -- 设置emcas的按键设置
;;; Commentary:
;;; Code:

(require 'evil)

(fset 'next-lines
   (kmacro-lambda-form [?j ?j ?j ?j ?j ?j ?j ?j ?j ?j ?j ?j ?j ?j ?j ?j ?j ?j ?j ?j] 0 "%d"))

(define-key evil-normal-state-map
  (kbd "C-j")
  'next-lines)

(fset 'previous-lines
   (kmacro-lambda-form [?k ?k ?k ?k ?k ?k ?k ?k ?k ?k ?k ?k ?k ?k ?k ?k ?k ?k ?k ?k] 0 "%d"))

(define-key evil-normal-state-map
  (kbd "C-k")
  'previous-lines)

(provide 'init-keybindings)

;;; init-keybindings.el ends here
