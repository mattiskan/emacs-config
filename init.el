(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))



(add-hook 'after-init-hook 'smartparens-global-mode)


(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))



;; bindings:
(global-set-key (kbd "M-i") 'previous-buffer)
(global-set-key (kbd "M-o") 'next-buffer)
(global-set-key (kbd "C-h") 'delete-backward-char)


;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
  )


;; disable annoying buffers
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

(add-hook 'minibuffer-exit-hook
	  '(lambda ()
	     (let ((buffer "*Completions*"))
	       (and (get-buffer buffer)
		    (kill-buffer buffer)))))
