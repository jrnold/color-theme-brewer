;;; colorbrewer.el --- ColorBrewer color schemes

;; Copyright (C) 2011  Jeffrey Arnold

;; Author: Jeffrey Arnold <jeffrey.arnold@gmail.com>
;; Keywords: faces, 

;; Color palettes from ColorBrewer 2.0, http://colorbrewer2.org/
;; This only includes the qualitative color palettes.

;; Links to ColorBrewer themes used in colorbrewer-palette
;; Accent http://colorbrewer2.org/index.php?type=qualitative&scheme=Accent&n=8
;; Dark2 http://colorbrewer2.org/index.php?type=qualitative&scheme=Dark2&n=8
;; Paired http://colorbrewer2.org/index.php?type=qualitative&scheme=Paired&n=11
;; Pastel1 http://colorbrewer2.org/index.php?type=qualitative&scheme=Pastel1&n=9
;; Pastel2 http://colorbrewer2.org/index.php?type=qualitative&scheme=Pastel2&n=8
;; Set1 http://colorbrewer2.org/index.php?type=qualitative&scheme=Set1&n=9
;; Set2 http://colorbrewer2.org/index.php?type=qualitative&scheme=Set2&n=8
;; Set3 http://colorbrewer2.org/index.php?type=qualitative&scheme=Set3&n=12

;; Set1 tried to match hues with color-theme-standard

(defconst colorbrewer-palettes 
  '((accent .
	    ((green . "#7FC97F")
	     (purple . "#BEAED4")
	     (orange . "#FDC086")
	     (yellow . "#FFFF99")
	     (blue . "#386CB0")
	     (magenta . "#F0027F")
	     (brown . "#BF5B17")
	     (darkgray . "#666666")))
    (dark2 . 
	   ((cyan . "#1B9E77")
	    (orange . "#D95F02")
	    (purple . "#7570B3")
	    (magenta . "#E7298A")
	    (green . "#66A61E")
	    (gold . "#E6AB02")
	    (brown . "#A6761D")
	    (darkgray . "#666666")))
    (paired . 
	    ((ltblue . "#A6CEE3")
	     (dkblue . "#1F78B4")
	     (ltgreen . "#B2DF8A")
	     (dkgreen . "#33A02C")
	     (ltred . "#FB9A99")
	     (dkred . "#E31A1C")
	     (ltorange . "#FDBF6F")
	     (dkorange . "#FF7F00")
	     (ltpurple . "#CAB2D6")
	     (dkpurple . "#6A3D9A")
	     (yellow . "#FFFF99")))
    (pastel1 . 
	     ((red . "#FBB4AE")
	      (blue . "#B3CDE3")
	      (green . "#CCEBC5")
	      (purple . "#DECBE4")
	      (orange . "#FED9A6")
	      (yellow . "#FFFFCC")
	      (brown . "#E5D8BD")
	      (pink . "#FDDAEC")
	      (gray . "#F2F2F2")))
    (pastel2 . 
	     ((bluegreen . "#B3E2CD")
	      (orange . "#FDCDAC")
	      (purple . "#CBD5E8")
	      (red . "#F4CAE4")
	      (yellowgreen . "#E6F5C9")
	      (yellow . "#FFF2AE")
	      (pink . "#F1E2CC")
	      (gray . "#CCCCCC")))
    (set1 .
	  ((red . "#E41A1C")
	   (blue . "#377EB8")
	   (green . "#4DAF4A")
	   (purple . "#984EA3")
	   (orange . "#FF7F00")
	   (yellow . "#FFFF33")
	   (brown . "#A65628")
	   (pink . "#F781BF")
	   (gray . "#999999")))
    (set2 . 
	  ((bluegreen . "#66c2a5")
	   (orange . "#fc8d62")
	   (purple . "#8da0cb")
	   (pink . "#e78ac3")
	   (green . "#a6d854")
	   (yellow . "#ffd92f")
	   (brown . "#e5c494")
	   (gray . "#b3b3b3")
	   ))
    (set3 .
	  ((bluegreen . "#8DD3C7")
	   (yellow . "#FFFFB3")
	   (purple . "#BEBADA")
	   (red . "#FB8072")
	   (blue . "#80B1D3")
	   (orange . "#FDB462")
	   (green . "#B3DE69")
	   (pink . "#FCCDE5")
	   (ltgray . "#D9D9D9")
	   (dkpurple . "#BC80BD")
	   (ltgreen . "#CCEBC5")
	   (dkyellow . "#FFED6F")))
    )
  )

(defun colorbrewer-color (palette &optional color)
  (let ((ret (cdr (assq palette colorbrewer-palettes))))
    (if color 
	(cdr (assq color ret))
      ret)))

(defun color-theme-brewer-set1 ()
  "Color theme based on the ColorBrewer Qualitative Color Scheme Set 1"
  (interactive)
  (color-theme-install
   `(color-theme-brewer-set1
     ((foreground-color . "black")
      (background-color . "white")
      (mouse-color . "black")
      (cursor-color . "black")
      (border-color . "black")
      (background-mode . light))
     (default ((t (nil))))
     (bold ((t (:bold t))))
     (italic ((t (:italic t :slant italic))))
     (bold-italic ((t (:bold t :italic t :slant italic))))
     (underline ((t (:underline t))))

     (fringe ((t (:background "#000000"))))
     (region ((t (:background "gray"))))
     (mode-line ((t (:foreground "#000000" :background "#666666"))))
     (minibuffer-prompt ((t (:foreground "#7299ff" :bold t))))
     
     ;; linum
     ;; set to comment color
     (linum ((t (:foreground ,(colorbrewer-color 'set1 'gray)))))
     
     ;; font-lock faces
     (font-lock-comment-face ((t (:foreground ,(colorbrewer-color 'set1 'gray)))))       
     (font-lock-comment-delimiter-face ((t (:foreground ,(colorbrewer-color 'set1 'gray)))))

     (font-lock-preprocessor-face ((t (:foreground ,(colorbrewer-color 'set1 'green)))))
     (font-lock-type-face ((t (:foreground ,(colorbrewer-color 'set1 'green)))))

     (font-lock-builtin-face ((t (:foreground ,(colorbrewer-color 'set1 'pink)))))

     (font-lock-keyword-face ((t (:foreground ,(colorbrewer-color 'set1 'purple)))))
     
     (font-lock-function-name-face ((t (:foreground ,(colorbrewer-color 'set1 'blue)))))
     (font-lock-constant-face ((t (:foreground ,(colorbrewer-color 'set1 'blue)))))

     (font-lock-variable-name-face ((t (:foreground ,(colorbrewer-color 'set1 'orange)))))

     (font-lock-string-face ((t (:foreground ,(colorbrewer-color 'set1 'brown)))))
     (font-lock-doc-face ((t (:foreground ,(colorbrewer-color 'set1 'brown)))))
     (font-lock-doc-string-face ((t (:foreground ,(colorbrewer-color 'set1 'gray)))))
     
     (font-lock-warning-face ((t (:foreground ,(colorbrewer-color 'set1 'red) :bold t))))

     (font-lock-negation-face ((t (nil))))
     (font-lock-regexp-grouping-backslash ((t (nil))))
     (font-lock-regexp-grouping-construct ((t (nil))))

     (link ((t (nil))))
     (link-visited ((t (nil))))
     (show-paren-match-face ((t (:background ,(colorbrewer-color 'set1 'yellow)))))
     (show-paren-mismatch-face ((t (:background ,(colorbrewer-color 'set1 'red)))))

     ;; Flyspell
     (flyspell-incorrect ((t (:foreground ,(colorbrewer-color 'set1 'red) :underline t))))
     (flyspell-duplicate ((t (:foreground ,(colorbrewer-color 'set1 'red) :underline t))))
     ;; LaTeX 
     (font-latex-bold-face ((t (:bold t))))
     (font-latex-doctex-documentation-face ((t (:foreground ,(colorbrewer-color 'set1 'gray)))))
     (font-latex-doctex-preprocessor-face ((t (:foreground ,(colorbrewer-color 'set1 'green)))))
     (font-latex-math-face ((t (:foreground ,(colorbrewer-color 'set1 'brown))))) 
     (font-latex-sectioning-0-face ((t (:bold t))))           
     (font-latex-sectioning-1-face ((t (:bold t))))
     (font-latex-sectioning-2-face ((t (:bold t))))
     (font-latex-sectioning-3-face ((t (:bold t))))              
     (font-latex-sectioning-4-face ((t (:bold t))))             
     (font-latex-sectioning-5-face ((t (:bold t))))            
     (font-latex-sedate-face ((t (:foreground ,(colorbrewer-color 'set1 'gray)))))
     (font-latex-slide-title-face ((t (:bold t))))
     (font-latex-string-face ((t (nil))))
     (font-latex-subscript-face ((t (nil))))                                 
     (font-latex-superscript-face ((t (nil))))                         
     (font-latex-verbatim-face ((t (nil))))                 
     (font-latex-warning-face ((t (:foreground ,(colorbrewer-color 'set1 'red)))))

     ;; Markdown Faces
     (markdown-blockquote-face ((t (nil))))
     (markdown-bold-face ((t (:bold t))))
     (markdown-comment-face ((t (:foreground ,(colorbrewer-color 'set1 'gray)))))
     (markdown-header-face ((t (:bold t))))
     (markdown-header-face-1 ((t (:bold t))))
     (markdown-header-face-2 ((t (:bold t))))
     (markdown-header-face-3 ((t (:bold t))))
     (markdown-header-face-4 ((t (:bold t))))
     (markdown-header-face-5 ((t (:bold t))))
     (markdown-header-face-6 ((t (:bold t))))
     (markdown-inline-code-face ((t (:foreground ,(colorbrewer-color 'set1 'green)))))
     (markdown-italic-face ((t (:italic t))))
     (markdown-link-face ((t (nil))))
     (markdown-link-title-face ((t (nil))))
     (markdown-list-face ((t (nil))))
     ;; same as font-latex-math-face
     (markdown-math-face ((t (:foreground ,(colorbrewer-color 'set1 'brown)))))
     (markdown-pre-face ((t (nil))))
     (markdown-reference-face ((t (nil))))
     (markdown-url-face ((t (nil))))

     ;; org-mode
     ;; (org-agenda-clocking ((t ())))
;; org-agenda-column-dateline
;; org-agenda-date
;; org-agenda-date-today
;; org-agenda-date-weekend
;; org-agenda-diary
;; org-agenda-dimmed-todo-face
;; org-agenda-done
;; org-agenda-restriction-lock
;; org-agenda-structure
;; org-archived
;; org-block
;; org-checkbox
;; org-checkbox-statistics-done
;; org-checkbox-statistics-todo
;; org-clock-overlay
;; org-code
;; org-column
;; org-column-title
;; org-date
;; org-document-info
;; org-document-info-keyword
;; org-document-title
;; org-done
;; org-drawer
;; org-ellipsis
;; org-footnote
;; org-formula
;; org-headline-done
;; org-hide
;; org-latex-and-export-specials
;; org-level-1
;; org-level-2
;; org-level-3
;; org-level-4
;; org-level-5
;; org-level-6
;; org-level-7
;; org-level-8
;; org-link
;; org-meta-line
;; org-mode-line-clock
;; org-mode-line-clock-overrun
;; org-property-value
;; org-quote
;; org-scheduled
;; org-scheduled-previously
;; org-scheduled-today
;; org-sexp-date
;; org-special-keyword
;; org-table
;; org-tag
;; org-target
;; org-time-grid
;; org-todo
;; org-upcoming-deadline
;; org-verbatim
;; org-verse
     ;; (org-warning ((t (:foreground ,(colorbrewer-color 'set1 'red))))
     
     )))

(provide 'colorbrewer)

;;; colorbrewer.el ends here
