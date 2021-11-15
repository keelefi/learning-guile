(display "hello from file!") (newline)

;;; define square and use it
(define (square x)
    (* x x))
(display "9^2 = ") (display (square 9)) (newline)

;;; display result of fact 5. Note that fact was not defined here, but in the C program.
(display "5! = ") (display (fact 5)) (newline)
