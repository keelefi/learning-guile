#!/usr/bin/guile -s
!#

(use-modules (srfi srfi-9))

(display "Hello from script!") (newline) (newline)

(define-record-type employee
    (make-employee-impl name age salary manager position)
    employee?
    (name       employee-name)
    (age        employee-age)
    (salary     employee-salary     set-employee-salary!)
    (manager    employee-manager)
    (position   employee-position))

(define* (make-employee name age #:key (salary 3000) (manager '()) (position "developer"))
    (make-employee-impl name age salary manager position))

(define joe (make-employee "Joe" 55 #:position "CEO"))
(define josh (make-employee "Josh" 45 #:manager joe #:position "Developer"))

(display "name: ") (display (employee-name joe)) (newline)
(display "salary: ") (display (employee-salary joe)) (newline) (newline)

(display "Joe gets an increase in salary!") (newline) (newline)

(set-employee-salary! joe (+ (employee-salary joe) 2000))

(display "name: ") (display (employee-name joe)) (newline)
(display "salary: ") (display (employee-salary joe)) (newline) (newline)

(display "Can we get Joe's new salary from the reference Josh has?") (newline) (newline)

(display "name: ") (display (employee-name (employee-manager josh))) (newline)
(display "salary: ") (display (employee-salary (employee-manager josh))) (newline) (newline)

(display "Yes!") (newline)
