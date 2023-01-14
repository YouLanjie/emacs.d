;;; custom.el --- 通过custom接口生成的配置保存文件   -*- lexical-binding: t; -*-

;; Copyright (C) 2023 YouLanjie

;; Author:  <youlanjie@archlinux>
;; Keywords: lisp, tools

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

;; nothing

;;; Code:


;(provide 'custom)
;;; custom.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-tab-always-indent t)
 '(custom-buffer-indent 8)
 '(custom-safe-themes
   '("496c40b4a34c441d71d537deebbaa288aa6d3762b9ff366535364d5bd6a69e22" "81eedac030249f826681ab768953f5b0f671d4b069bd6c9c486f762644b24d7c" default))
 '(evil-indent-convert-tabs t)
 '(face-font-family-alternatives '(("JetBrains Mono" "AR PL KaitiM GB")))
 '(org-agenda-files '("/home/youlanjie/.emacs.d/org-files/GTD.org"))
 '(package-selected-packages
   '(yaml-mode flycheck-clang-analyzer org-ehtml org-bullets yasnippet-snippets which-key valign use-package smooth-scrolling smart-mode-line powerline-evil magit flycheck company-box benchmark-init atom-one-dark-theme atom-dark-theme airline-themes))
 '(truncate-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
