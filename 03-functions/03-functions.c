#include <stdio.h>

#include <libguile.h>

SCM factorial(SCM param)
{
    unsigned int n = scm_to_uint(param);

    unsigned int result = 1;
    for (unsigned int i = 2; i <= n; ++i)
    {
        result = result * i;
    }

    return scm_from_uint(result);
}

void main_func(void *data, int argc, char *argv[]);

void main(int argc, char *argv[])
{
    scm_boot_guile(argc, argv, main_func, NULL);
}

void main_func(void *data, int argc, char *argv[])
{
    scm_c_define_gsubr("factorial", 1, 0, 0, factorial);

    scm_c_primitive_load("script.scm");
}
