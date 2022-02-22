#!/usr/bin/guile -s
!#

;;; textual-ports needed for get-string-all
(use-modules (ice-9 textual-ports))

(define file-to-read "employees.json")

;;; read file using open-file (remember to close with close-port)
(define input-port (open-file file-to-read "r"))
(display (get-string-all input-port)) (newline)
(close-port input-port)

;;; read file using with-input-from-file
(display
    (with-input-from-file file-to-read
        (lambda () (get-string-all (current-input-port)))))
(newline)

;;; read file using call-with-input-file with unnamed lambda
(display
    (call-with-input-file file-to-read
        (lambda (input-port) (get-string-all input-port))))
(newline)

;;; read file using call-with-input-file with named function
(define (display-string-all input-port) (display (get-string-all input-port)))
(call-with-input-file file-to-read display-string-all)
(newline)
