(let ((default-directory "~/.emacs.d/"))
      (normal-top-level-add-subdirs-to-load-path))

(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)

;;(setq ispell-dictionary "british")
;;(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)
(dolist (hook '(text-mode-hook))
        (add-hook hook (lambda () (flyspell-mode 1))))

(load-file "~/.emacs.d/themes/monokai-theme.el")
(color-theme-monokai)

(scroll-bar-mode 0)
(tool-bar-mode 0)

(show-paren-mode t)
(line-number-mode t)
(column-number-mode t)
;;(global-linum-mode t)

(require 'whitespace)
(setq-default whitespace-style '(face trailing lines-tail))
(setq whitespace-line-column 80)
(global-whitespace-mode t)

;;(require 'fill-column-indicator)
;;(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;;(global-fci-mode 1)
;;(setq fci-rule-color "red")
;;(setq-default fci-rule-column 80)

(setq TeX-PDF-mode t) ;; make pdf the default auctex generating format

;; racket
(require 'quack)
(load-file "~/.emacs.d/geiser-0.3/elisp/geiser.el")
(add-hook 'scheme-mode-hook 'geiser-mode)
(load-file "~/.emacs.d/scheme-complete/scheme-complete-0.8.7.el")
(autoload 'scheme-smart-complete "scheme-complete" nil t)
(eval-after-load 'scheme
  '(define-key scheme-mode-map "\t" 'scheme-complete-or-indent))

;; octave
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(autoload 'paredit-mode "paredit"
      "Minor mode for pseudo-structurally editing Lisp code." t)
    (add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
    (add-hook 'lisp-mode-hook (lambda () (paredit-mode +1)))
    (add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
    (add-hook 'scheme-mode-hook (lambda () (paredit-mode +1)))

;;(setenv "PATH" (concat "/home/nitro/.opam/3.12.1/bin" (getenv "PATH")))
;;(setq exec-path (cons "/home/nitro/.opam/3.12.1/bin" exec-path))
(setenv "PATH" (concat "/home/nitro/.opam/4.00.1/bin" (getenv "PATH")))
(setq exec-path (cons "/home/nitro/.opam/4.00.1/bin" exec-path))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TypeRex configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Loading TypeRex mode for OCaml files
(add-to-list 'load-path "/home/nitro/.emacs.d")
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . typerex-mode))
(add-to-list 'interpreter-mode-alist '("ocamlrun" . typerex-mode))
(add-to-list 'interpreter-mode-alist '("ocaml" . typerex-mode))
(autoload 'typerex-mode "typerex" "Major mode for editing Caml code" t)

;; TypeRex mode configuration
(setq ocp-server-command "/opt/typerex/ocp-wizard")
(setq-default indent-tabs-mode nil)

;; Uncomment to enable typerex command menu by right click
;;(setq ocp-menu-trigger [mouse-3])

;; Uncomment to make new syntax coloring look almost like Tuareg
;;(setq ocp-theme "tuareg_like")
;; Uncomment to disable new syntax coloring and use Tuareg one
;;(setq ocp-theme "tuareg")
;; Uncomment to disable syntax coloring completely
;;(setq ocp-syntax-coloring nil)

;; TypeRex currently uses the Tuareg indentation mechanism. To get a result
;; closer to the OCaml programming guidelines described at
;; http://caml.inria.fr/resources/doc/guides/guidelines.en.html
;; Some users prefer to indent slightly less, as
;;(setq typerex-let-always-indent nil)
;;(setq typerex-with-indent 0)
;;(setq typerex-function-indent 0)
;;(setq typerex-fun-indent 0)
;; Another reasonable choice regarding if-then-else is:
;;(setq typerex-if-then-else-indent 0)


;;;; Auto completion (experimental)
;;;; Don't use M-x invert-face default with auto-complete! (emacs -r is OK)
;;(add-to-list 'load-path "/home/nitro/.emacs.d/auto-complete-mode")
(setq ocp-auto-complete t)

;;;; Using <`> to complete whatever the context, and <C-`> for `
;;(setq auto-complete-keys 'ac-keys-backquote-backslash)
;;;; Options: nil (default), 'ac-keys-default-start-with-c-tab, 'ac-keys-two-dollar
;;;; Note: this overrides individual auto-complete key settings

;;;; I want immediate menu pop-up
(setq ac-auto-show-menu 0.)
;;;; Short delay before showing help
(setq ac-quick-help-delay 0.2)
;;;; Number of characters required to start (nil to disable)
(setq ac-auto-start 3)

;;;; Uncomment to enable auto complete mode globally (independently of OCaml)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/nitro/.emacs.d/auto-complete-mode/ac-dict")
(ac-config-default)
;;(add-to-list 'ac-modes 'typerex-mode)
;;(add-hook 'typerex-mode-hook 'ac-modes)

;; For debugging only
;;;;(setq ocp-debug t)
;;;;(setq ocp-profile t)
;;;;(setq ocp-dont-catch-errors t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of TypeRex configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
