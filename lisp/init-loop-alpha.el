;;; init-loop-alpha.el --- 循环切换窗口透明度        -*- lexical-binding: t; -*-

;; Copyright (C) 2023

;; Author:  <youlanjie@Chglish>
;; Keywords: tools, lisp

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

;; set transparent effect
(defgroup local-loop-alpha nil
  "循环切换窗口透明度."
  :group 'local-loop-alpha)
(defcustom local-loop-alpha-enable nil
  "启动开关."
  :type 'boolean
  :group 'local-loop-alpha)
(defcustom local-loop-alpha-key "<f7>"
  "切换快捷键."
  :type 'string
  :group 'local-loop-alpha)
(defcustom local-loop-alpha-list '((100 100) (90 65) (85 55) (75 45) (65 35))
  "切换透明度列表."
  :type 'list
  :group 'local-loop-alpha)
(if local-loop-alpha-enable
    (progn
      (defun loop-alpha ()
	"循环切换窗口透明度."
	(interactive)
	(let ((h (car local-loop-alpha-list)))                ;; head value will set to
	  ((lambda (a ab)
	     (set-frame-parameter (selected-frame) 'alpha (list a ab))
	     (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
	     ) (car h) (car (cdr h)))
	  (setq local-loop-alpha-list
		(cdr (append local-loop-alpha-list (list h))))
	  ))
      (global-set-key (kbd local-loop-alpha-key) 'loop-alpha)
    )
)

(provide 'init-loop-alpha)
;;; init-loop-alpha.el ends here

