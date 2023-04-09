;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Pranav Nachanekar"
      user-mail-address "pranavnachanekar@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")
(after! org
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(d!)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "DNF(f@/!)""CANCELLED(c@/!)"))))
  (setq org-default-notes-file (convert-standard-filename "~/Dropbox/org/refile.org"))
  (setq +org-capture-notes-file (convert-standard-filename "~/Dropbox/org/refile.org"))
  (setq org-default-todo-file (convert-standard-filename "~/Dropbox/org/refile.org"))
  (setq +org-capture-todo-file (convert-standard-filename "~/Dropbox/org/refile.org"))
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-following-days 7
        org-habit-preceding-days 35
        org-habit-show-habits t
        org-habit-graph-column 140)
  (setq org-capture-templates
        `(("t" "Todos") ;; Todos for different situations
          ("tq" "Quick Todo" entry (file+headline "refile.org" "Todos") "* TODO %?\n") ;; Quickly add a todo to refile later
          ("tp" "Personal Todo" entry (file+headline "life.org" "Todos") "* TODO %?\n SCHEDULED: %^t") ;; Add a todo to life.org, prompts for scheduled time
          ("tr" "Research Todo" entry (file+headline "research.org" "Todos" "* TODO %?\n SCHEDULED: %^t\n DEADLINE: %^t\n")) ;; Add to do for research project, prompts for both scheduled time and deadline
          ;; Watch list management
          ("w" "Watchlist Item")
          ;; Add new item to watchlist
          ("wt" "To watch/read/play")
          ("wtm" "Movie to watch"   entry (file+headline "watchlist.org" "Movies")   "* TODO %?\n" )
          ("wtb" "Book to read"     entry (file+headline "watchlist.org" "Books")    "* TODO %?\n" )
          ("wtm" "TV Show to watch" entry (file+headline "watchlist.org" "TV Shows") "* TODO %?\n" )
          ("wtm" "Game to play"     entry (file+headline "watchlist.org" "Games")    "* TODO %?\n" )
          ;; Add done item to watchlist, asks for rating and
          ("wd" "watched/read/played")
          ("wdm" "Movie watched"   entry (file+headline "watchlist.org" "Movies")   "* TODO %^{Title} \n %^{rating}p \n:Review:\n%?\n:END:" )
          ("wdb" "Book read"       entry (file+headline "watchlist.org" "Books")    "* TODO %^{Title} \n %^{rating}p \n%?" )
          ("wdm" "TV Show watched" entry (file+headline "watchlist.org" "TV Shows") "* TODO %^{Title} \n %^{rating}p \n%?" )
          ("wdm" "Game played"     entry (file+headline "watchlist.org" "Games")    "* TODO %^{Title} \n %^{rating}p \n%?" )

          )
  ))

;; CC Clang setup
(after! lsp-clangd
  (setq lsp-clients-clangd-args
        '("-j=3"
          "--background-index"
          "--clang-tidy"
          "--completion-style=detailed"
          "--header-insertion=never"
          "--header-insertion-decorators=0"))
  (set-lsp-priority! 'clangd 2))




;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
