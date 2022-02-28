#!/usr/bin/guile -s
!#

(define (alist-equal? alist-left alist-right)
    (define (alist-equal-internal? alist-left alist-right)
        (define (alist-equal-element? pair alist)
            (define second-pair (assoc (car pair) alist))
            (cond
                ((boolean? second-pair) #f)
                ;((list? second-pair)
                ;    (alist-equal? (cdr pair) (cdr second-pair)))
                (else 
                    (equal? (cdr pair) (cdr second-pair)))))
        (cond
            ((null? alist-left) #t)
            ((alist-equal-element? (car alist-left) alist-right) (alist-equal-internal? (cdr alist-left) alist-right))
            (else #f)))
    (cond
        ((equal? (length alist-left) (length alist-right)) (alist-equal-internal? alist-left alist-right))
        (else #f)))

