(setq inhibit-splash-screen t)

;; (update-directory-autoloads "~/emacsen/vendors/")

(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

;; (add-to-list 'auto-mode-alist '("\\.clj$" . paredit-mode))


;; (setq auto-mode-alist (cons '("\\.clj$" . paredit-mode) auto-mode-alist))

;; (setq auto-mode-alist '(("\\.jade$" . jade-mode) ("\\.haml$" . haml-mode) ("\\.gemspec$" . ruby-mode) ("Rakefile$" . ruby-mode) ("\\.rake$" . ruby-mode) ("\\.rxml$" . ruby-mode) ("\\.rjs$" . ruby-mode) ("\\.applescript$" . applescript-mode) ("\\.yml$" . yaml-mode) ("\\.rb$" . ruby-mode) ("\\.clj$" . clojure-mode) ("\\.cp\\'" . c++-mode)))

;;;   (add-to-list 'load-path "/path/to/elisp")
;;;   (autoload 'enable-paredit-mode "paredit"
;;;     "Turn on pseudo-structural editing of Lisp code."
;;;     t)
;;;
;;; Enable Paredit Mode on the fly with `M-x enable-paredit-mode RET',
;;; or always enable it in a major mode `M' (e.g., `lisp') with:
;;;

;; (add-hook clojure-mode-hook 'enable-paredit-mode)

;; (setq clojure-mode-hook '())

;; clojure-mode-hook

