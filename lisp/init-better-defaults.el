;;; init-better-defaults.el -- 设置emcas的基本设置
;;; Commentary:
;;; Code:

;; 模式类
(add-hook 'after-init-hook
	  (progn
	    (save-place-mode t)
	    ;; 记忆文件上次打开的位置
	    (electric-pair-mode t)
	    ;; 自动补全括号
	    (column-number-mode t)
	    ;; 在 Mode line 上显示列号
	    (global-auto-revert-mode t)
	    ;; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
	    (delete-selection-mode t)
	    ;; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
	    (global-display-line-numbers-mode t)
	    ;; 在 Window 显示行号
	    (global-hl-line-mode t)
	    ;; 高亮当前行
	    ;; (savehist-mode t)
	    ;; （可选）打开 Buffer 历史记录保存
	    (global-display-fill-column-indicator-mode t)
	    ;; 在第80行设置一个标尺（一条竖线）提示不要越过它
	    ))

;; 专注于编程
(add-hook 'prog-mode-hook
	  (progn
	    (show-paren-mode t)
	    ;; 编程模式下，光标在括号上时高亮另一个括号
	    ;; (indent-tabs-mode t)
	    ;; 使用Tab键缩进
	    ))
(add-hook 'prog-mode-hook 'hs-minor-mode)
;; 编程模式下，可以折叠代码块

;; 设置变量类
(setq-default make-backup-files nil
	      ;; 关闭文件自动备份
	      auto-save-default nil
	      ;; 关闭自动保存
	      ;; display-line-numbers-type 'relative
	      ;; （可选）显示相对行号（可在custonize中设置，见custom.el）
	      fill-column 80
	      ;; 设置默认到80行就自动折行
              c-basic-offset 8
              tab-width 8
	      )

(fset 'yes-or-no-p 'y-or-n-p)
;; 设置别名（yes/no）

(provide 'init-better-defaults)

;;; init-better-defaults.el ends here
