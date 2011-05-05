;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messags* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

;; Aquamacs Emacs Starter Kit
;; http://github.com/walter/aquamacs-emacs-starter-kit
;; set the dotfiles-dir variable to this directory


(setq kitfiles-dir (concat (file-name-directory
                    (or (buffer-file-name) load-file-name)) "/aquamacs-emacs-starter-kit"))

;; set up our various directories to load
(add-to-list 'load-path kitfiles-dir)
(add-to-list 'load-path "~/Library/Application Support/Aquamacs Emacs/vendor/paredit/")
(require 'init)

;; -----------------
;; Awesome autocomplete
;; -----------------

(add-to-list 'load-path "~/Library/Application Support/Aquamacs Emacs/vendor/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/Library/Application Support/Aquamacs Emacs/vendor//ac-dict")
(ac-config-default)

(require 'paredit)
(autoload 'paredit-mode "paredit"
      "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'slime-mode-hook (lambda () (paredit-mode +1)))

;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

;;Slime Config
(add-to-list 'load-path "~/src/slime/")
(require 'slime)
(slime-setup '(slime-repl slime-js))

;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;; 	  (lambda ()
;; 	    (slime-js-minor-mode 1)))
;; (add-to-list 'slime-lisp-implementations '(sbcl ("sbcl")))
;;; Slime/Lisp/Paredit
(define-key slime-mode-map (kbd "C-c w") 'paredit-wrap-sexp)
(define-key slime-repl-mode-map (kbd "C-c w") 'paredit-wrap-sexp)


(require 'clojure-mode)

(defun clojure-font-lock-setup ()
  (interactive)
  (set (make-local-variable 'lisp-indent-function)
       'clojure-indent-function)
  (set (make-local-variable 'lisp-doc-string-elt-property)
       'clojure-doc-string-elt)
  (set (make-local-variable 'font-lock-multiline) t)

  (add-to-list 'font-lock-extend-region-functions
               'clojure-font-lock-extend-region-def t)

  (when clojure-mode-font-lock-comment-sexp
    (add-to-list 'font-lock-extend-region-functions
                 'clojure-font-lock-extend-region-comment t)
    (make-local-variable 'clojure-font-lock-keywords)
    (add-to-list 'clojure-font-lock-keywords
                 'clojure-font-lock-mark-comment t)
    (set (make-local-variable 'open-paren-in-column-0-is-defun-start) nil))

  (setq font-lock-defaults
        '(clojure-font-lock-keywords    ; keywords
          nil nil
          (("+-*/.<>=!?$%_&~^:@" . "w")) ; syntax alist
          nil
          (font-lock-mark-block-function . mark-defun)
          (font-lock-syntactic-face-function
           . lisp-font-lock-syntactic-face-function))))

(add-hook 'slime-repl-mode-hook
          (lambda ()
            ;; (font-lock-mode nil)
            (clojure-font-lock-setup)
            ;; (font-lock-mode t)
	    ))


(defadvice slime-repl-emit (after sr-emit-ad activate)
  (with-current-buffer (slime-output-buffer)
    (add-text-properties slime-output-start slime-output-end
                         '(font-lock-face slime-repl-output-face
                                          rear-nonsticky (font-lock-face)))))

(defadvice slime-repl-insert-prompt (after sr-prompt-ad activate)
  (with-current-buffer (slime-output-buffer)
    (let ((inhibit-read-only t))
      (add-text-properties slime-repl-prompt-start-mark (point-max)
                           '(font-lock-face slime-repl-prompt-face
                                            rear-nonsticky
                                            (slime-repl-prompt
                                             read-only
                                             font-lock-face
                                             intangible))))))

(require 'rainbow-delimiters)
(autoload 'rainbow-delimiters-mode "rainbow-delimiters" t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (rainbow-delimiters-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (rainbow-delimiters-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (rainbow-delimiters-mode +1)))
;; (add-hook 'slime-repl-mode-hook (lambda () (rainbow-delimiters-mode +1)))
(add-hook 'slime-mode-hook (lambda () (rainbow-delimiters-mode +1)))

(require 'highlight-parentheses)
(autoload 'highlight-parentheses-mode "highlight parentheis" t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (highlight-parentheses-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (highlight-parentheses-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (highlight-parentheses-mode +1)))
;; (add-hook 'slime-repl-mode-hook (lambda () (highlight-parentheses-mode +1)))
(add-hook 'slime-mode-hook (lambda () (highlight-parentheses-mode +1)))

;;Color theme
(require 'zenburn)
(color-theme-zenburn)


;; CDT
;; (progn
;;   (setq cdt-dir "/Users/adie/src/cdt")
;;   (setq cdt-source-path "/Users/adie/src/zip/clojure-1.2.0/src/jvm:/Users/adie/src/zip/clojure-1.2.0/src/clj:/Users/adie/src/zip/clojure-contrib-1.2.0/src/main/clojure:")
;;   (load-file (format "%s/ide/emacs/cdt.el" cdt-dir)))

;; JS2 Mode

;; (add-to-list 'load-path "~/Library/Application Support/Aquamacs Emacs/vendor/js2-mode/")
;; (autoload 'js2-mode "js2-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; YASnippet
(add-to-list 'load-path "~/Library/Application Support/Aquamacs Emacs/vendor/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/Library/Application Support/Aquamacs Emacs/vendor/yasnippet-0.6.1c/snippets")

;; Magit
(autoload 'magit-status "magit" nil t)
(global-set-key "\C-ci" 'magit-status)

;; HAML Mode
(add-to-list 'load-path "~/Library/Application Support/Aquamacs Emacs/vendor/haml-mode")
(require 'haml-mode)
(add-hook 'haml-mode-hook
					'(lambda ()
						 (setq indent-tabs-mode nil)
						 (define-key haml-mode-map "\C-m" 'newline-and-indent)))

;; Jade Mode
(add-to-list 'load-path "~/Library/Application Support/Aquamacs Emacs/vendor/jade-mode")
(require 'jade-mode)
