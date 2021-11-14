#include <stdio.h>

#include <libguile.h>

void main_func(void *data, int argc, char *argv[]);

void main(int argc, char *argv[])
{
    scm_boot_guile(argc, argv, main_func, NULL);
}

void main_func(void *data, int argc, char *argv[])
{
    scm_c_eval_string("(display \"hello Guile!\") (newline)");

    scm_c_eval_string("(define (square x) (* x x))");
    scm_c_eval_string("(display \"9^2 = \") (display (square 9)) (newline)");

    scm_c_eval_string("(define (fact n) (if (= n 1) 1 (* n (fact (- n 1)))))");
    scm_c_eval_string("(display \"5! = \") (display (fact 5)) (newline)");
}
