#! /usr/bin/sbcl --script
;; #! /usr/bin/env clisp
;; Copyright (C) 2021 Nathan Paul Simons (2hmuFQDSHf-code@hardcorehackers.com)
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
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

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

;; To compile with SBCL:
;; (sb-ext:save-lisp-and-die "executable.exe"
;;                           :toplevel 'main
;;                           :executable t)

;; Also see "Compile your program using:" in
;; /usr/share/doc/sbcl/README.Debian
;; (compile-file "file1.lisp")
;; (compile-file "file2.lisp")

(defun my-getenv (name &optional default)
  #+CMU
  (let ((x (assoc name ext:*environment-list*
                  :test #'string=)))
    (if x (cdr x) default))
  #-CMU
  (or
   #+Allegro (sys:getenv name)
   #+CLISP (ext:getenv name)
   #+ECL (si:getenv name)
   #+LISPWORKS (lispworks:environment-variable name)
   #+SBCL (sb-unix::posix-getenv name)
   default))

(defun my-command-line ()
  (or 
   #+CLISP *args*
   #+CMU extensions:*command-line-words*
   #+LISPWORKS system:*line-arguments-list*
   #+SBCL *posix-argv*  
   nil))

(defun print-arguments (arguments)
  (if (< 0 (length arguments))
      (format t "~&~S~&" arguments)))

(defun say-hello (to)
  (format nil "Hello, ~a" to))

(defun main ()
  (let ((msg "world"))
    (print-arguments (my-command-line))
    (format t "~a" (say-hello msg))))

(main)

;; Local variables:
;;   coding: utf-8
;;   mode: Lisp
;; End:
;; vi: fileformat=unix fileencoding=utf-8 filetype=lisp expandtab :
