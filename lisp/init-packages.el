;;; init-packages.el -- 加载插件
;;; Commentary:
;;; Code:

;; 添加仓库
(require 'package)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
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
;; 主题
;; (use-package atom-one-dark-theme
;;   ;; 加载主题
;;   :init (load-theme 'atom-one-dark t))
(use-package monokai-theme
  :init (load-theme 'monokai))
;; 开启evil模式 -- 使用vim键位
(use-package evil
  :init (evil-mode))
;; 启动速度检查
(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))
;; 更好的状态栏
;; (use-package smart-mode-line
;;   :init
;;   (setq sml/no-confirm-load-theme t)
;;   (setq sml/theme 'respectful)
;;   (sml/setup))
;; 使用像vim一样的Powerline（状态栏）
;; (use-package powerline-evil
;;   :init
;;   (powerline-evil-vim-color-theme)
;;   ;; (powerline-default-theme)
;;   :config
;;   (require 'powerline))
;; Powerline
;; (use-package powerline
;;   :init
;;   (powerline-default-theme))
;; 其他状态栏
(use-package doom-modeline
  :init (doom-modeline-mode 1))
;; 显示可用键位
(use-package which-key
  :init (which-key-mode))
;; 自动补全
(use-package company
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自动补全
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence))) ; 根据选择的频率进行排序，读者如果不喜欢可以去掉
;; 补全模板
(use-package yasnippet
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
;; 默认补全模板
(use-package yasnippet-snippets
  :after yasnippet)
;; 针对org-mode符号的美化（因字体问题取消）
(use-package org-bullets
  ; :custom
  ; (org-bullets-bullet-list '("◉" "○""✸" "✿" "✜" "◆""▶"))
  ; (org-ellipsis "⤵")
  :hook (org-mode . org-bullets-mode))
;; 命令输入
(use-package smex
  :init
  (smex-initialize)
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands)
  ("C-c C-c M-x" . execute-extended-command))
;; 语法检查，比vim的好
(use-package flycheck
  :config
  (setq truncate-lines nil) ; 如果单行信息很长会自动换行
  :hook
  (prog-mode . flycheck-mode))
(use-package flycheck-clang-analyzer
  :after flycheck
  :config
  (setq flycheck-clang-analyzer-executable "clang")
  :hook
  (c-mode . flycheck-clang-analyzer-setup))
;; LSP语法解析
(use-package lsp-mode
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
;; 项目管理插件
(use-package projectile
  ;; 全局 enable 这个 minor mode
  :init (projectile-mode 1)
  :config
  ;; 把它的缓存挪到 ~/.emacs.d/.cache/ 文件夹下，让 gitignore 好做
  (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory))
  ;; 定义和它有关的功能的 leader key
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
;; git管理工具
(use-package magit
  :bind
  ("C-c m" . magit))
;; 窗口数字编号
(use-package window-numbering
  :init (window-numbering-mode))
;; Org表格对齐
(use-package valign
  :init (require 'valign)
  :hook (org-mode-hook . valign-mode))
;; 类Vim的折叠
(use-package vimish-fold
  :init (vimish-fold-global-mode 1)
  :config
  (global-set-key (kbd "C-c F f") 'vimish-fold)
  (global-set-key (kbd "C-c F u") 'vimish-fold-unfold)
  (global-set-key (kbd "C-c F d") 'vimish-fold-delete)
  (global-set-key (kbd "C-c F t") 'vimish-fold-toggle)
  (fset 'fold-function
	(kmacro-lambda-form [?? ?^ ?\{ return ?k ?V ?/ ?^ ?\} return ?\M-x ?v ?i ?m ?i ?s ?h ?- ?f ?o ?l ?d return] 0 "%d"))
  (global-set-key (kbd "C-c F F") 'fold-function)
  )
;; Org html代码高亮
(use-package htmlize)
;; 可视化Undo功能
(use-package vundo
  :bind ("C-x u" . vundo))
;;  Undo tree解决emacs的撤回痛点（卡顿大）
;; (use-package undo-tree
;;   :init (global-undo-tree-mode)
;;   :config  (setq undo-tree-history-directory-alist `(("." . "~/.emacs.d/.cache/undo/"))))
;; (use-package pyim
;;   :config
;;   ;; 加载 basedict 拼音词库。
;;   (pyim-basedict-enable)
;;   ;; 将 Emacs 默认输入法设置为 pyim.
;;   (setq default-input-method "pyim")
;;   ;; 显示 5 个候选词。
;;   (setq pyim-page-length 5)
;;   ;; 金手指设置，可以将光标处的编码（比如：拼音字符串）转换为中文。
;;   (global-set-key (kbd "M-j") 'pyim-convert-string-at-point)
;;   ;; 设置 pyim 默认使用的输入法策略，我使用全拼。
;;   (pyim-default-scheme 'quanpin)
;;   ;; 开启代码搜索中文功能（比如拼音，五笔码等）
;;   (pyim-isearch-mode 1)
;;   )

;; 像vim一样平滑的滚动
;; (use-package smooth-scrolling
;;   :init (smooth-scrolling-mode)
;;   :config
;;   (setq scroll-margin 3
;; 	scroll-conservatively 9999
;; 	scroll-step 1))

;; Org图表绘图
;; (use-package gnuplot)

(provide 'init-packages)

;;; init-packages.el ends here
