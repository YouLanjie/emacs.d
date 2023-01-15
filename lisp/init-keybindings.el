;;; init-keybindings.el -- 设置emcas的基本设置
;;; Commentary:
;;; Code:

(global-set-key [f12] 'evil-mode)
;(global-set-key (kbd "C-m") 'forward-char)

;; 打开列表中含有的指定的配置文件（第一个，能用就行）
(defun open-config-files()
  "打开指定的配置文件."
  (interactive)
  (let ((choices '("~/.emacs.d/org-files/GTD.org"
		   "~/.emacs.d/init.el"
		   "~/.emacs.d/custom.el"
		   "~/.emacs.d/lisp/init-keybindings.el"
		   "~/.emacs.d/lisp/init-packages.el"
		   "~/.emacs.d/lisp/init-better-defaults.el"
		   "~/.emacs.d/lisp/init-ui.el"
		   "~/.emacs.d/lisp/init-org.el"
		   "~/.emacs.d/lisp/init-quickly-input-c.el"
		   ))
	(local-num 0)
	(local-return_name "~/.emacs.d/init.el"))
    (split-window-right)
    (other-window 1)
    (switch-to-buffer "*FileList*")
    (erase-buffer)
    (mapc (lambda (filename)
	    (insert (int-to-string (+ local-num 1)) " " filename "\n")
	    (setq-local local-num (+ local-num 1)))
	    choices)
    (setq-local local-num (read-number "Which you want to open?" 1))
    (insert "local-number:" (int-to-string local-num) "\t\n")
    (mapc (lambda (filename)
	    (setq-local local-num (- local-num 1))
	    (if (= local-num 0)
		(setq-local local-return_name filename))
	    (insert (int-to-string local-num) filename local-return_name "\n"))
	    choices)
    (find-file local-return_name)))
(global-set-key (kbd "<f5>") 'open-config-files)

(provide 'init-keybindings)

;;; init-keybindings.el ends here
