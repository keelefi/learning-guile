(use-modules (srfi srfi-9))

(display "hello from file!") (newline) (newline)

(define-record-type employee
    (make-employee-impl name age salary position)
    employee?
    (name       employee-name)
    (age        employee-age)
    (salary     employee-salary     set-employee-salary!)
    (position   employee-position))

(define* (make-employee name age #:key (salary 3000) (position "developer"))
    (make-employee-impl name age salary position))

(define joe (make-employee "Joe" 55 #:position "CEO"))

(define josh (make-employee "Josh" 45 #:salary 6000))

(define (print-employee employee)
    (display "name: ") (display (employee-name employee)) (newline)
    (display "age: ") (display (employee-age employee)) (newline)
    (display "salary: ") (display (employee-salary employee)) (newline)
    (display "position: ") (display (employee-position employee)) (newline))

(print-employee joe) (newline)
(print-employee josh) (newline)

(display "Josh gets an increase in salary!") (newline) (newline)

(set-employee-salary! josh (+ (employee-salary josh) 2000))

(print-employee josh) (newline)
