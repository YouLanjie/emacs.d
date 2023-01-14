;;; init-auto-insert.el --- 为了自动添加文件头               -*- lexical-binding: t; -*-

;; Copyright (C) 2023

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


;;; Code:

;;设置 auto-insert 模版文件存放目录
(setq-default auto-insert-directory "~/.emacs.d/auto-insert/")
;;; 启用auto-insert
(auto-insert-mode)
;; 默认情况下插入模版前会循问你要不要自动插入，这里设置为不必询问，
(setq auto-insert-query nil)
(defun autoinsert-yas-expand()
  "Replace text in yasnippet template."
  (yas-expand-snippet (buffer-string) (point-min) (point-max)))
(defun autoinsert-setting()
  "设置要插入的文件."
  (define-auto-insert "\\.sh" [ "insert-sh" autoinsert-yas-expand])
  (define-auto-insert "\\.h" [ "insert-c-head" autoinsert-yas-expand])
  (define-auto-insert '("\\.c\\'" . "C skeleton") [ "insert-c" autoinsert-yas-expand]))
;;这个就是新建以.c 结尾的C文件时，会自动插入c-auto-insert文件中的内容
;(define-auto-insert "\\.c" [ "auto-insert-c.c"])
(eval-after-load 'autoinsert '(autoinsert-setting))


(provide 'init-auto-insert)
;;; init-auto-insert.el ends here
