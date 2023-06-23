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
;;(setq doom-theme 'doom-nord)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")
(after! org
  (setq org-todo-keywords
        (quote ((sequence "IDEA(t)" "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(d!)")
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
          ("wdm" "Movie watched"   entry (file+headline "watchlist.org" "Movies")   "* DONE %^{Title} \n %^{rating}p \n:Review:\n%?\n:END:\n" )
          ("wdb" "Book read"       entry (file+headline "watchlist.org" "Books")    "* DONE %^{Title} \n %^{rating}p \n%?" )
          ("wdm" "TV Show watched" entry (file+headline "watchlist.org" "TV Shows") "* DONE %^{Title} \n %^{rating}p \n%?" )
          ("wdm" "Game played"     entry (file+headline "watchlist.org" "Games")    "* DONE %^{Title} \n %^{rating}p \n%?" )

          )
  )
  (setq org-agenda-custom-commands
        '(("w" tags "+watchlist")
          ;; add saved searches here
          ))
)

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

