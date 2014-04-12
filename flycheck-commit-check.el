;;; flycheck-commit-check.el --- Flycheck checker for commit-check  -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Tom Willemse

;; Author: Tom Willemse <tom@ryuslash.org>
;; Keywords: convenience
;; Version: 0.1.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A flycheck checker that uses commit-check to provide checking for
;; git commit messages. Read the README for more information, or go to
;; http://code.ryuslash.org/flycheck-commit-check/about/

;;; Code:

(require 'flycheck)

(flycheck-define-checker git-commit-check
  "A git commit checker"
  :command ("commit-check" "-0" source)
  :error-patterns ((error line-start "commit-check:"
                          (one-or-more (not (any ":"))) ":" line ": "
                          (message) line-end))
  :modes git-commit-mode)

(add-to-list 'flycheck-checkers 'git-commit-check)

(provide 'flycheck-commit-check)
;;; flycheck-commit-check.el ends here
