;;; init-ui.el --- 视觉层配置                        -*- lexical-binding: t; -*-

;; Copyright (C) 2023 YouLanjie

;; Author:  <youlanjie@archlinux>
;; Keywords: lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(load-theme 'atom-one-dark t)
; 加载主题
(setq inhibit-startup-message t)
; 关闭启动 Emacs 时的欢迎界面

(tool-bar-mode 0)
(menu-bar-mode 0)
; 关闭 Tool bar and Menu bar

(display-time-mode 1)
;; 状态栏常显时间
;(setq display-time-24hr-format t)
;; 格式
(setq display-time-day-and-date t)
;; 显示时间、星期、日期

(add-to-list 'default-frame-alist '(width . 80))
; （可选）设定启动图形界面时的初始 Frame 宽度（字符数）
(add-to-list 'default-frame-alist '(height . 24))
; （可选）设定启动图形界面时的初始 Frame 高度（字符数）

(when (display-graphic-p) (toggle-scroll-bar -1))
; 图形界面时关闭滚动条

(setq gc-cons-threshold most-positive-fixnum)
(set-face-attribute 'default nil :height 140)
;(set-default-font "JetBrains Mono 14")
; (set-face-attribute 'default nil :font "AR PL KaitiM GB")
;; 字体设置（请改成自己使用的）
(set-face-attribute 'default nil :font "JetBrains Mono")
(set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "JetBrains Mono" :size 18 :weight 'bold))
(set-fontset-font t 'unicode (font-spec :family "AR PL UMing CN" :size 22))

(provide 'init-ui)

;;; init-ui.el ends here
