;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of the files.

;;; Code:

(add-to-list 'load-path "~/.emacs.d/lisp/")
; 设定源码加载路径

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file 'no-error 'no-message)
;; 设置默认的custom设置保存文件（私人）
(require 'init-custom)
;; 读取分发出去的custom设置


(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)
(require 'init-auto-insert)
(require 'init-quickly-input-c)
(require 'init-auto-save)
(require 'init-open-files)
; 加载模块

;;; init.el ends here
