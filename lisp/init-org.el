;;; init-org.el -- 设置emcas的基本设置
;;; Commentary:
;;; Code:

;; 设置 Org Agenda 快捷键
;(if (string= major-mode "org-mode") (message "This is org-mode!"))
;(if (string= major-mode "org-mode") (global-set-key (kbd "C-c a") 'org-agenda))
(add-hook 'org-mode-hook
	  (lambda ()
	    (command-execute 'org-indent-mode)
	    (local-set-key (kbd "C-c a") 'org-agenda)))

;; 加入到日程列表里
;(setq org-agenda-files (list "~/org-mode/GTD.org"))

;;key for initialize file

(provide 'init-org)

;;; init-org.el ends here
