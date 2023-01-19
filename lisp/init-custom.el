;;; init-custom.el --- 通过接口产生的配置保存        -*- lexical-binding: t; -*-

;; Copyright (C) 2023  

;; Author:  <youlanjie@Chglish>
;; Keywords: 

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

(custom-set-variables
 ;; 显示相对行号
 '(display-line-numbers-type 'relative)
 ;; 开启自动保存
 '(local-auto-save-enable t)
 ;; 打开文件快捷键启用设置
 ;; '(local-open-files-enable t)
 ;; Org-mode 的导出设置
 '(org-export-backends '(ascii html man md odt texinfo groff))
 ;; 不折行
 '(truncate-lines t))

(provide 'init-custom)
;;; init-custom.el ends here

