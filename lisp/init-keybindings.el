;;; init-keybindings.el -- 设置emcas的基本设置
;;; Commentary:
;;; Code:

(global-set-key [f12] 'evil-mode)
;(global-set-key (kbd "C-m") 'forward-char)

(defun open-config-files()
  "打开一个配置文件."
  (interactive "sPlease select a file you want by name:")
  (split-window-right)
  (other-window 1)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f5>") 'open-config-files)

(provide 'init-keybindings)

;;; init-keybindings.el ends here
