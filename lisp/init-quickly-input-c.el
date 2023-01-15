;;; init-quickly-input-c.el --- 用于c语言快速输入                    -*- lexical-binding: t; -*-

;; Copyright (C) 2023 YouLanjie

;; Author:  <youlanjie@archlinux>
;; Keywords: c, tools

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

(add-hook
 'c-mode-hook
 '(lambda ()
    "设置C语言的补全插入功能"

    ;; 在上一行插入注释
    (local-set-key
     (kbd "] /")
     '(lambda ()
	(interactive)
	(previous-line)
	(move-end-of-line 1)
	(newline-and-indent)
	(insert "/*  */")
	(left-char 3)))

    ;; 在当前行末插入注释
    (local-set-key
     (kbd "] .")
     '(lambda ()
	(interactive)
	(move-end-of-line 1)
	(insert "    /*  */")
	(left-char 3)))
    ))


(provide 'init-quickly-input-c)

;;; init-quickly-input-c.el ends here
