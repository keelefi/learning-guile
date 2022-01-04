#!/usr/bin/guile -s
!#

(use-modules (srfi srfi-64))

(display "Hello from script!") (newline) (newline)

(test-begin "booleans")

(test-assert (boolean? #t))
(test-assert (boolean? #f))
(test-assert #t)
(test-assert #true)
(test-assert (not #f))
(test-assert (not #false))

(test-end "booleans")

(test-begin "integers")

(test-assert (integer? 3))
(test-assert (integer? -3))
(test-assert (integer? 3.0))
(test-assert (not (integer? 3.1)))

(test-end "integers")
