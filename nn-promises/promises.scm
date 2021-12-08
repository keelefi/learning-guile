#!/usr/bin/guile -s
!#

(display "Hello from script!") (newline) (newline)

(define my-promise (delay (system "echo hello")))
(define my-promise-exit-1 (delay (system "exit 1")))

(display "Promises created, let's run them") (newline) (newline)

(display "Promise result: ") (display (force my-promise)) (newline) (newline)

(display "Promise result: ") (display (force my-promise-exit-1)) (newline) (newline)

;;; prints 256 instead of 1???
