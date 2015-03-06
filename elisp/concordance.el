;;;
;;; Concordance.el
;;;

(setq split-width-threshold 9999)

(setq current-concordance-path "~/.concordance/")

(defun set-concordance-path (dir)
  (interactive (list (read-directory-name "dSet concordance path (default ~/.concordance/): "
                                          current-concordance-path
                                          current-concordance-path
                                          t)))
  (setq current-concordance-path dir))


(defun concordance (arg)
  (interactive "sKeyword: ")
  (with-output-to-temp-buffer "*conc*" 0
                              (princ (shell-command-to-string (concat "/bin/egrep " arg " -R -n " current-concordance-path))))
  (with-current-buffer "*conc*"
      (highlight-regexp "^[^:]+:[0-9]+:" font-lock-constant-face)
      (highlight-regexp "^[^:]+:" font-lock-comment-face)
      (highlight-regexp w font-lock-keyword-face)
    ))

(defun concordance-at ()
  (interactive)
  (let ((w (thing-at-point 'word)))
    (with-output-to-temp-buffer "*conc*" 0
                                (princ (shell-command-to-string (concat "/bin/egrep " w " -R -n " current-concordance-path))))
    (with-current-buffer "*conc*"
      (highlight-regexp "^[^:]+:[0-9]+:" font-lock-constant-face)
      (highlight-regexp "^[^:]+:" font-lock-comment-face)
      (highlight-regexp w font-lock-keyword-face)
      )))

(global-set-key "\M-m" 'concordance)
(global-set-key "\M-M" 'concordance-at)
