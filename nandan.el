

;; (when (boundp 'aquamacs-version)
;;   (one-buffer-one-frame-mode))

;; If I want the original files location, I use this, otherwise
;; I've put the old files into vendors/oldAquamacs
;; (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;      (let* ((my-lisp-dir "~/nb/elisp-and-emacs/")
;;            (default-directory my-lisp-dir))
;;         (setq load-path (cons my-lisp-dir load-path))
;;         (normal-top-level-add-subdirs-to-load-path)))

;; (require 'nunb)
;; (require 'lisper)
(lp)
(global-set-key [C-o] 'other-window)

(defn G74204 [])
(switch-to-buffer "*Messages*")


;;; From http://stackoverflow.com/questions/5168262/emacs-write-buffer-to-new-file-but-keep-this-file-open

(defun save-as (new-filename)
  (interactive "FFilename:")
  ;; overwrites file, unfortunately.
  (let* ((fnid (gensym)))
    (insert (format "(defn %s []" fnid))
    (write-region (region-beginning) (region-end) new-filename "append")
    (insert ")")))

(global-set-key (kbd "<f2>w") 'save-as)
 (defn G74205 [])

;; (defn G74202 [])
(defun extractfn (new-filename)
  (interactive "FFilename:")
  (let* ((fnid (gensym))
	 (text (delete-and-extract-region (region-beginning) (region-end))))
    (with-current-buffer  (find-file-noselect new-filename)
      (goto-char (point-max))
      (insert (format "(defn %s []
                           %s )" fnid  
			  text))
      (newline)
      (with-temp-message "Writing file..."
	(save-buffer))
      (message "Writing file...done"))))

(global-set-key (kbd "<f2>w") 'extractfn)

 
 
