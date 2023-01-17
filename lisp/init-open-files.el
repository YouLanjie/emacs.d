;;; init-open-files.el -- 设置emcas的按键设置
;;; Commentary:
;;; Code:

(defgroup local-open-files nil
  "打开配置文件快捷键."
  :group 'local-open-files)

(defcustom local-open-files-enable nil
  "是否启用该快捷键."
  :type 'boolean
  :group 'local-open-files)

(defcustom local-open-files-key1 "<f5>"
  "右建window打开快捷键定义."
  :type 'string
  :group 'local-open-files)

(defcustom local-open-files-key2 "<f6>"
  "当前window打开快捷键定义."
  :type 'string
  :group 'local-open-files)

(defcustom local-open-files-list '("~/.emacs.d/init.el")
  "自定义的文件列表."
  :type 'list
  :group 'local-open-files)

(defvar local-open-files-type t)

;; 打开列表中含有的指定的配置文件（第一个，能用就行）
(defun local-open-files-run()
  "快捷打开选择的文件."
  (interactive)
  (let ((local-num 0)
	(local-return_name "~/.emacs.d/init.el"))
    (if local-open-files-type
	(progn
	  (split-window-right)
	  (other-window 1)
	  ))
    (switch-to-buffer "*FileList*")
    (erase-buffer)
    (mapc (lambda (filename)
	    (insert (int-to-string (+ local-num 1)) " " filename "\n")
	    (setq-local local-num (+ local-num 1)))
	    local-open-files-list)
    (setq-local local-num (read-number "Which you want to open?" 1))
    (insert "local-number:" (int-to-string local-num) "\t\n")
    (mapc (lambda (filename)
	    (setq-local local-num (- local-num 1))
	    (if (= local-num 0)
		(setq-local local-return_name filename))
	    (insert (int-to-string local-num) filename local-return_name "\n"))
	    local-open-files-list)
    (setq-local local-num 0)
    (find-file local-return_name)
    (kill-buffer "*FileList*")))

(add-hook 'after-init-hook
	  (lambda ()
	    (if local-open-files-enable
		(progn
		  (global-set-key
		   (kbd local-open-files-key1)
		   (lambda ()
		     (interactive)
		     (setq local-open-files-type t)
		     (local-open-files-run)))

		  (global-set-key
		   (kbd local-open-files-key2)
		   (lambda ()
		     (interactive)
		     (setq local-open-files-type nil)
		     (local-open-files-run)))
		  ))
	    ))

(provide 'init-open-files)

;;; init-open-files.el ends here
