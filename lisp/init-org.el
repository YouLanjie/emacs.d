;;; init-org.el -- 设置emcas的基本设置
;;; Commentary:
;;; Code:

;; 设置 Org Agenda 快捷键
;(if (string= major-mode "org-mode") (message "This is org-mode!"))
;(if (string= major-mode "org-mode") (global-set-key (kbd "C-c a") 'org-agenda))
(add-hook 'org-mode-hook
	  (lambda ()
	    (command-execute 'org-indent-mode)
	    (local-set-key (kbd "C-c a") 'org-agenda)
	    (define-key evil-normal-state-map
	      (kbd "TAB")
	      'org-cycle)
	    ))

;; 在中文中即使不留空格，也会将目标字符串等宽强调
;;(setq org-emphasis-regexp-components
      ;; add multibyte char at pre and post For chinese
      ;;'("-[:space:][:multibyte:]('\"{" "-[:space:][:multibyte:].,:!?;'\")}\\[" "[:space:]" "." 1))
;; (org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)

;; Non-nil means interpret "_" and "^" for display.
;; 适用于导出
(setq org-export-with-sub-superscripts '{})
;; 适用于org-mode中渲染
(setq org-use-sub-superscripts '{})

(setq org-latex-pdf-process
	'("xelatex %f"
	  "rm -fr %b.out %b.log %b.brf %b.bbl auto"
	  ))
(setq org-latex-compiler "xelatex")

;;key for initialize file

(provide 'init-org)

;;; init-org.el ends here
