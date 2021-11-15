#include <stdio.h>

#include <libguile.h>

void main_func(void *data, int argc, char *argv[]);

void main(int argc, char *argv[])
{
    scm_boot_guile(argc, argv, main_func, NULL);
}

void main_func(void *data, int argc, char *argv[])
{
    scm_c_primitive_load("script.scm");
}
