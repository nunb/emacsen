

;; (when (boundp 'aquamacs-version)
;;   (one-buffer-one-frame-mode))

;; If I want the original files location, I use this, otherwise
;; I've put the old files into vendors/oldAquamacs
;; (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;      (let* ((my-lisp-dir "~/nb/elisp-and-emacs/")
;;            (default-directory my-lisp-dir))
;;         (setq load-path (cons my-lisp-dir load-path))
;;         (normal-top-level-add-subdirs-to-load-path)))

(require 'nunb)
(require 'lisper)
(lp)
(global-set-key [C-o] 'other-window)

(switch-to-buffer "*Messages*")