#!/usr/bin/guile -s
!#

(use-modules (json))

(define-json-type <employee>
    (name)
    (salary))

(define john-json "{\"name\": \"john\", \"salary\": 1337}")
(define john (json->employee john-json))

(display "name: ") (display (employee-name john)) (newline)
(display "salary: ") (display (employee-salary john)) (newline)

(newline)

(define my-json-document "{\
    \"employees\": {\
        \"john\": {\"age\": 40, \"salary\": 1337},\
        \"joe\": {\"age\": 25, \"salary\": 666}\
    }\
}")
(define my-document (json-string->scm my-json-document))

(define employees (assoc "employees" my-document))
(cond ((eq? employees #f) (raise-exception "employees undefined")))

(display employees) (newline)
(display (cdr employees)) (newline)
(display (car (cdr employees))) (newline)
(display (car (car (cdr employees)))) (newline)
(display (cdr (car (cdr employees)))) (newline)
(display (cdr (assoc "age" (cdr (car (cdr employees)))))) (newline)

(newline)

(define (print-employee employee)
    (display "name: ") (display (car employee)) (newline)
    (display "age: ") (display (cdr (assoc "age" (cdr employee)))) (newline)
    (display "salary: ") (display (cdr (assoc "salary" (cdr employee)))) (newline))

(define (print-employees employees)
    (print-employee (car employees))
    (newline)
    (cond ((not (null? (cdr employees))) (print-employees (cdr employees)))))

(print-employees (cdr employees))
