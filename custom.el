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
 '(display-line-numbers-type 'relative)
 '(evil-indent-convert-tabs t)
 '(local-auto-save-idle 7)
 '(local-open-files-enable t)
 '(local-open-files-list
   '("~/.emacs.d/org-files/GTD.org" "~/.emacs.d/init.el" "~/.emacs.d/custom.el" "~/.emacs.d/lisp/init-keybindings.el" "~/.emacs.d/lisp/init-packages.el" "~/.emacs.d/lisp/init-better-defaults.el" "~/.emacs.d/lisp/init-ui.el" "~/.emacs.d/lisp/init-org.el" "~/.emacs.d/lisp/init-quickly-input-c.el" "~/.emacs.d/lisp/init-auto-save.el"))
 '(org-agenda-files '("/home/youlanjie/.emacs.d/org-files/GTD.org"))
 '(org-export-backends '(ascii html man md odt texinfo groff))
 '(truncate-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
