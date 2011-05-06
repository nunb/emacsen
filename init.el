;; Turn off mouse interface early in startup to avoid momentary display via ESK
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;; Require common stuff
(require 'cl)
(require 'uniquify)
(require 'ansi-color)
(require 'saveplace)

(global-set-key (kbd "<f1>e") 'eval-region)
(global-set-key (kbd "<f1>e") 'eval-region)

;; Print out loadpath with timestamp
(defun lp ()
  (message "At %s \t %s" (current-time-string) load-path))

(lp)
;; This file's directory
(setq init-dir (file-name-directory
		(or (buffer-file-name) load-file-name)))

;; Add this dir to loadpath
(setq load-path (cons init-dir load-path))
;; below line is deprecated because it won't work if the file is loaded
;; with the startup -l flag:
;; (normal-top-level-add-to-load-path (list default-directory))

(require 'nunb-loader)   ;; setup load path fns

(setq vendor-dir "~/emacsen/vendors/")
(setq config-dir "~/emacsen/vendors-configs/")

;; (setq load-path (cons vendor-dir load-path))
;; need all subdirectories in vendors:
(nunb-set-loadpath-all-under vendor-dir)
(setq load-path (cons config-dir load-path))

(require 'loaddefs)
(require 'magit)

;;(message "Latest ...") 
;; (lp)

(switch-to-buffer "*Messages*")

(nunb-load-system-and-user) ;; load any system and user files

;;(nunb-set-loadpath-all-under vendor-dir)
;;(nunb-set-loadpath-all-under config-dir)
;; == equiv to? ==
;; (mapc #'nunb-set-loadpath-all-under
;;       (list
;;        vendor-dir
;;        config-dir))


;; ( TESTINK
;; (nunb-set-loadpath-all-under "/tmp/newp/")
;; (message "%s" (nreverse load-path))
;; (lp)

