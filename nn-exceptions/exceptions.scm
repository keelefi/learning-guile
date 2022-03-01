#!/usr/bin/guile -s
!#

(use-modules (ice-9 exceptions))

(display "Hello from script!") (newline) (newline)

(with-exception-handler
    (lambda (exception-obj)
        (display "Exception: ") (display exception-obj) (newline))
    (lambda () (raise-exception "my exception"))
    #:unwind? #t)

(newline)

(define (my-exception-handler exception-obj)
    (cond
        ((exception-with-message? exception-obj)
            (display "Exception: ") (display (exception-message exception-obj)) (newline))
        (else
            (display "Exception? ") (display (exception? exception-obj)) (newline))))

(with-exception-handler
    my-exception-handler
    (lambda () (raise-exception (make-exception-with-message "my message")))
    #:unwind? #t
    #:unwind-for-type &message)

(newline)

(with-exception-handler
    my-exception-handler
    (lambda () (raise-exception (make-error)))
    #:unwind? #t)

(newline)

(define-exception-type
    &my-exception       ; name
    &error              ; parent
    make-my-exception   ; constructor
    my-exception?       ; predicate
    (message my-exception-message))

(with-exception-handler
    (lambda (exception-obj)
        (display "My exception: ") (display (my-exception-message exception-obj)) (newline))
    (lambda () (raise-exception (make-my-exception "my exception message")))
    #:unwind? #t
    #:unwind-for-type &my-exception)

(newline)

(define-exception-type
    &my-derived-exception       ; name
    &my-exception               ; parent
    make-my-derived-exception   ; constructor
    my-derived-exception?       ; predicate
    (extra my-derived-exception-extra))

(with-exception-handler
    (lambda (exception-obj)
        (display "My derived exception message: ") (display (my-exception-message exception-obj)) (newline)
        (display "My derived exception extra: ") (display (my-derived-exception-extra exception-obj)) (newline))
    (lambda () (raise-exception (make-my-derived-exception "the message" "the extra")))
    #:unwind? #t
    #:unwind-for-type &my-derived-exception)
