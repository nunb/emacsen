(setq inhibit-splash-screen t)

;; (update-directory-autoloads "~/emacsen/vendors/")

(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))