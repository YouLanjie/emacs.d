;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of the files.

;;; Code:

;; 设置默认的custom设置保存文件（私人）
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file 'no-error 'no-message)

;; 加载模块

;; 设定(添加)源码加载路径
(add-to-list 'load-path "~/.emacs.d/lisp/")

(let ((gc-cons-threshold most-positive-fixnum)
      (file-name-handler-alist nil))
  ;; 读取分离出去的custom设置
  (require 'init-custom)

  ;; 设置类
  ;; 插件
  (require 'init-packages)
  ;; UI
  (require 'init-ui)
  ;; 默认设置
  (require 'init-better-defaults)
  ;; 按键
  (require 'init-keybindings)
  ;; Org-mode
  (require 'init-org)
  ;; 自动插入
  (require 'init-auto-insert)
  ;; 快速输入
  (require 'init-quickly-input-c)

  ;; 自己编写的“插件”
  ;; 自动保存
  (require 'init-auto-save)
  ;; 打开文件
  (require 'init-open-files)
  ;; 切换透明度
  (require 'init-loop-alpha)
  )

;;; init.el ends here
