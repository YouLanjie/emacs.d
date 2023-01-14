;;; init-better-defaults.el -- 设置emcas的基本设置
;;; Commentary:
;;; Code:

(save-place-mode 1)
; 记忆文件上次打开的位置
(electric-pair-mode t)
; 自动补全括号
(add-hook 'prog-mode-hook #'show-paren-mode)
; 编程模式下，光标在括号上时高亮另一个括号
(column-number-mode t)
; 在 Mode line 上显示列号
(global-auto-revert-mode t)
; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(delete-selection-mode t)
; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(setq make-backup-files nil)
; 关闭文件自动备份
(setq auto-save-default nil)
; 关闭自动保存
(add-hook 'prog-mode-hook #'hs-minor-mode)
; 编程模式下，可以折叠代码块
(global-display-line-numbers-mode 1)
; 在 Window 显示行号
(global-hl-line-mode 1)
; 高亮当前行
(savehist-mode 1)
; （可选）打开 Buffer 历史记录保存
(setq display-line-numbers-type 'relative)
; （可选）显示相对行号
(fset 'yes-or-no-p 'y-or-n-p)
; 设置别名（yes/no）
(setq-default fill-column 80)
; 设置默认到80行就自动折行
(add-hook 'after-init-hook 'global-display-fill-column-indicator-mode)
; 在第80行设置一个标尺（一条竖线）提示不要越过它

;(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 8
              tab-width 8
              indent-tabs-mode t)
; 设置缩进相关

(provide 'init-better-defaults)

;;; init-better-defaults.el ends here
