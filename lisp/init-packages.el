;;; init-packages.el -- 加载插件
;;; Commentary:
;;; Code:

;; 添加仓库
(require 'package)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-archives '(
  ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
  ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
  ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t)    ;不用每个包都手动添加:ensure t关键字
  (setq use-package-always-defer t)     ;默认都是延迟加载，不用每个包都手动添加:defer t
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally t)
  (setq use-package-verbose t))

;; 插件管理
(eval-when-compile
  (require 'use-package))
; 主题
(use-package atom-one-dark-theme)
; 开启evil模式 -- 使用vim键位
(use-package evil
  :ensure t
  :init (evil-mode))
(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))
; 更好的状态栏
(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  (sml/setup))
; 像vim一样平滑的滚动
;; (use-package smooth-scrolling
;;   :init (smooth-scrolling-mode)
;;   :config
;;   (setq scroll-margin 3
;; 	scroll-conservatively 9999
;; 	scroll-step 1))
; 使用像vim一样的Powerline（状态栏）
(use-package powerline-evil
  :init
  (powerline-evil-vim-color-theme)
  :config
  (require 'powerline)
  (display-time-mode t))
; 显示可用键位
(use-package which-key
  :ensure t
  :init (which-key-mode))
; 自动补全
(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自动补全
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence))) ; 根据选择的频率进行排序，读者如果不喜欢可以去掉
; 补全模板
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :hook
  (prog-mode . yas-minor-mode)
  :config
  ;; add company-yasnippet to company-backends
  (defun company-mode/backend-with-yas (backend)
    (if (and (listp backend) (member 'company-yasnippet backend))
	backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  ;; unbind <TAB> completion
  (define-key yas-minor-mode-map [(tab)]        nil)
  (define-key yas-minor-mode-map (kbd "TAB")    nil)
  (define-key yas-minor-mode-map (kbd "<tab>")  nil)
  ;; 配置模板
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "~/.emacs.d/snippets/"))
  :bind
  (:map yas-minor-mode-map ("S-<tab>" . yas-expand)))
; 默认补全模板
(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)
; 针对org-mode符号的美化（因字体问题取消）
(use-package org-bullets
  ; :custom
  ; (org-bullets-bullet-list '("◉" "○""✸" "✿" "✜" "◆""▶"))
  ; (org-ellipsis "⤵")
  :hook (org-mode . org-bullets-mode))
;; 命令输入
(use-package smex)
; 语法检查，比vim的好
(use-package flycheck
  :ensure t
  :config
  (setq truncate-lines nil) ; 如果单行信息很长会自动换行
  :hook
  (prog-mode . flycheck-mode))
(use-package flycheck-clang-analyzer
  :ensure t
  :after flycheck
  :config
  (setq flycheck-clang-analyzer-executable "clang")
  :hook
  (c-mode . flycheck-clang-analyzer-setup))
; LSP语法解析
(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l"
	lsp-file-watch-threshold 500)
  :hook
  (lsp-mode . lsp-enable-which-key-integration) ; which-key integration
  :commands (lsp lsp-deferred)
  :config
    (setq lsp-completion-provider :none) ;; 阻止 lsp 重新设置 company-backend 而覆盖我们 yasnippet 的设置
    (setq lsp-headerline-breadcrumb-enable t))
; git管理工具
(use-package magit
  :ensure t)
(use-package window-numbering
  :init (window-numbering-mode))
(use-package valign
  :ensure t
  :init (require 'valign)
  :hook (org-mode-hook . valign-mode))
;; Org图表绘图
;(use-package gnuplot)
; Undo tree解决emacs的撤回痛点（卡顿大）
;(use-package undo-tree
;  :ensure t
;  :init (global-undo-tree-mode))
;  :config  (setq undo-tree-history-directory-alist `(("." . "~/.emacs.d/.cache/undo/")))

(provide 'init-packages)

;;; init-packages.el ends here
