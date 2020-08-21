#! /usr/bin/env clisp
;;#! /usr/bin/sbcl --script
;; Copyright (C) 2020 Nathan Paul Simons (C2T9uE-code@hardcorehackers.com)
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; To compile to a standalone executable:
;;   1) Start clisp.
;;   2) Load your LISP funcions.
;;   3) Name your starting function "main", and call (EXT:EXIT) at the
;;      end of it.
;;   4) Run the following lisp code, replacing "executable.exe" with the
;;      name of the file you want to output to.
;;
;; (ext:saveinitmem "executable.exe"
;;                  :quiet t
;;                  :init-function 'main
;;                  :executable t
;;                  :norc t)

(if (< 0 (length *args*))
    (format t "~&~S~&" *args*))

(defun say-hello (to)
  (format nil "Hello, ~a" to))

(defvar msg "world")
(format t "~a" (say-hello msg))

;; Local Variables:
;;   mode: Lisp
;; End:
;; vi: fileformat=unix expandtab
