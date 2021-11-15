#include <stdio.h>

#include <libguile.h>

void main_func(void *data, int argc, char *argv[]);

void main(int argc, char *argv[])
{
    scm_boot_guile(argc, argv, main_func, NULL);
}

void main_func(void *data, int argc, char *argv[])
{
    scm_c_eval_string("(define (fact n) (if (= n 1) 1 (* n (fact (- n 1)))))");

    scm_c_primitive_load("script.scm");
}
