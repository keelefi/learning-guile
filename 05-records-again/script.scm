(use-modules (srfi srfi-9))

(display "hello from file!") (newline)

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

(display "name: ") (display (get_employee_name joe)) (newline)
(display "salary: ") (display (employee-salary joe)) (newline)

(display "Joe gets an increase in salary!") (newline) (newline)

(set_employee_salary! joe (+ (employee-salary joe) 2000))

(display "name: ") (display (get_employee_name joe)) (newline)
(display "salary: ") (display (employee-salary joe)) (newline)
