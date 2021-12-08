#!/usr/bin/guile -s
!#

(display "Hello from script!") (newline) (newline)

(define my-promise (delay (system "echo hello")))

(display "Promise is created, let's run it") (newline) (newline)

(force my-promise)

(display "Promise was run") (newline) (newline)

