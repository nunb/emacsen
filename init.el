;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;; Require common stuff
(require 'cl)
(require 'uniquify)
(require 'ansi-color)
(require 'saveplace)
;; (require 'paredit)

(setq init-dir (file-name-directory
		(or (buffer-file-name) load-file-name)))

;; saved oldpath, no point (setq emacs-load-path load-path) 
;; does not work, emacs wants to load vc-git when a git dir is detected
;; (setq load-path (cons init-dir nil))

(defun lp ()
  (message "At %s \t %s" (current-time-string) load-path))

(setq load-path (cons init-dir load-path))
;; (message "%s PATH %s DONE" init-dir load-path)

;; ;; (setq autoload-file (concat dotfiles-dir "loaddefs.el"))
;; ;; (setq package-user-dir (concat dotfiles-dir "elpa"))
;; ;; (setq custom-file (concat dotfiles-dir "custom.el"))

;; (normal-top-level-add-to-load-path (list default-directory))
;; load-path
;; (require 'nunb-loader)   ;; setup load path fns

(autoload 'paredit-mode "paredit" "Load paredit" t)

(setq vendor-dir "~/emacsen/vendors/")
(setq config-dir "~/emacsen/vendor-configs/")

(setq load-path (cons vendor-dir load-path))
(lp)
(setq load-path (cons config-dir load-path))
(lp)

(nunb-load-system-and-user) ;; load any system and user files

;;(nunb-set-loadpath-all-under vendor-dir)
;;(nunb-set-loadpath-all-under config-dir)
;; == equiv to? ==
;; (mapc #'nunb-set-loadpath-all-under
;;       (list
;;        vendor-dir
;;        config-dir))


;;(nunb-set-loadpath-all-under "/tmp/newp/")
;;(message "%s" (nreverse load-path))

