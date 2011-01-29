;;; hl-line.el --- highlight the current line
;;; GPL and header stripped for color-theme html album
;; Copyright (C) 1998, 2000, 2001 Free Software Foundation, Inc.
;;; Code:

(defgroup hl-line nil
  "Highlight the current line."
  :version "21.1"
  :group 'editing)

(defcustom hl-line-face 'highlight
  "Face with which to highlight the current line."
  :type 'face
  :group 'hl-line)

(defvar hl-line-overlay nil)

(defun hl-line-highlight ()
  "Active the Hl-Line overlay on the current line in the current window.
\(Unless it's a minibuffer window.)"
  (when hl-line-mode			; Could be made buffer-local.
    (unless (window-minibuffer-p (selected-window)) ; silly in minibuffer
      (unless hl-line-overlay
	(setq hl-line-overlay (make-overlay 1 1)) ; to be moved
	(overlay-put hl-line-overlay 'face hl-line-face))
      (overlay-put hl-line-overlay 'window (selected-window))
      (move-overlay hl-line-overlay
		    (line-beginning-position) (1+ (line-end-position))
		    (current-buffer)))))

(defun hl-line-unhighlight ()
  "Deactivate the Hl-Line overlay on the current line in the current window."
  (if hl-line-overlay
      (delete-overlay hl-line-overlay)))

;;;###autoload
(define-minor-mode hl-line-mode
  "Minor mode to highlight the line about point in the current window.
With ARG, turn Hl-Line mode on if ARG is positive, off otherwise.
Uses functions `hl-line-unhighlight' and `hl-line-highlight' on
`pre-command-hook' and `post-command-hook'."
  nil nil nil
  (if hl-line-mode
      (progn
	(add-hook 'pre-command-hook #'hl-line-unhighlight)
	(add-hook 'post-command-hook #'hl-line-highlight))
    (hl-line-unhighlight)
    (remove-hook 'pre-command-hook #'hl-line-unhighlight)
    (remove-hook 'post-command-hook #'hl-line-highlight)))

;;;###autoload
(easy-mmode-define-global-mode
 global-hl-line-mode hl-line-mode hl-line-mode
 :group 'hl-line)

(provide 'hl-line)

;;; hl-line.el ends here
