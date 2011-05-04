;; Add all subdirs in a given dir to the load-path

(defun nunb-set-loadpath-all-under (loaddir)
 "Takes a dir, and loads all of its subdirs into the load-path"
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (let* ((default-directory (or loaddir "~/emacsen/"))
	     (setq load-path (cons my-lisp-dir load-path))
	     (normal-top-level-add-subdirs-to-load-path))))


;; Where is this nunb-loader file?
(setq loader-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))


;; Load user and system specific customizations
(setq system-specific-config (concat loader-dir system-name ".el")
      user-specific-config (concat loader-dir user-login-name ".el")
      user-specific-dir (concat loader-dir user-login-name))
(add-to-list 'load-path user-specific-dir)


(defun nunb-load-system-and-user () ;; From ESK
  (if (file-exists-p system-specific-config) (load system-specific-config))
  (if (file-exists-p user-specific-config) (load user-specific-config))
  (if (file-exists-p user-specific-dir)
      (mapc #'load (directory-files user-specific-dir nil ".*el$"))))


(provide 'nunb-loader)
