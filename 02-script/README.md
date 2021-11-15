# 02-script

In this exercise we add a separate Scheme script file which we invoke by calling `scm_c_primitive_load()`. Note that the
script can use definitions from the C program. In our particular case, we defined `fact` in the C program and used that
definition in the script file.

## Compiling

The project should contain the following files:

    $ ls
    02-script.c configure.ac Makefile.in README.md script.scm

Use `autoconf` to create `configure`:

    $ autoreconf -vif configure.ac

Run `configure`:

    $ ./configure

Use make to compile and link `02-script`:

    $ make

## Running

After compiling `02-script`, run it:

    $ ./02-script
