;; czyzykowski.el

;; http://blog.czyzykowski.pl/simple-emacs-configuration

;; (load "~/.elisp/emacs-config")
;; (emacs-config-load-config "~/.elisp/config")

(defun emacs-config-strip-el (filename)
  "Strip .el suffix from the filename."
  (replace-regexp-in-string "\.el$" "" filename))

(defun emacs-config-list-el-files (dir)
  "List all *.el files in given directory."
  (sort (directory-files dir t "\.el$") 'string<))

(defun emacs-config-load-config (config-dir)
  "Load configuration files from given dir."
  (dolist (config-file (emacs-config-list-el-files config-dir))
    (unless (string-match ".*#.*" config-file)
      (load (emacs-config-strip-el config-file)))))

;; sorting in emacs-config-list-el-files gives some predictability for order of files loading: all files starting with _ will be loaded first (I'm using that for setting up loading paths and defining global functions).

;; Configuration files are usually only couple of lines. One for emacs shell:

(defun start-named-shell (&optional name)
  (interactive)
  (let ((shell-name (or name (read-string "Buffer name: " "shell"))))
    (shell (concat "*" shell-name "*"))))

(setq comint-input-ignoredups t)
(setq comint-scroll-to-bottom-on-input t)

(global-set-key [(control ?`)] 'start-named-shell)

(ansi-color-for-comint-mode-on)

;;For speeding up startup time and also to minimise loading of unused code I rarely use require instead of making frequent use of autoload, which delays loading module until last moment, when needed function from this module is actually needed. Unfortunately putting everything to autoload is not possible, as there are bits which are required from the start, like color-theme. But I can live with that.

(provide 'czyzykowski)
