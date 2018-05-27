(message "E M A C S")
(message ">> Early initialization")

(when window-system
  (switch-to-buffer (get-buffer "*Messages*")))

(message "-- Initialize package manager")

(package-initialize)

(message "-- Early Emacs configuration")

;; Repositories

(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

;; Don't let custom intefere with init script

(defconst my-custom-file "~/.emacs.d/custom.el")
(setq custom-file my-custom-file)
(load custom-file 'noerr)

(setq load-prefer-newer t)

(message "!! Handing over to org-babel to execute config.org !!")

;; Dynamically load elisp snippets from config.org

(org-babel-load-file "~/.emacs.d/config.org")
