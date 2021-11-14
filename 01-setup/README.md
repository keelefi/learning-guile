# 01-setup

In this exercise we setup building of a C program which links `libguile`. `libguile` has full Scheme support and
therefore our C program is able to execute Scheme code. In this exercise we use `scm_c_eval_string()` to execute Scheme
commands.

To initialize Guile, we call `scm_boot_guile()` from the `main()` function. We pass `scm_boot_guile()` a function,
`main_func()`, which it executes. See the documentation here: [Initializing
Guile](https://www.gnu.org/software/guile/manual/html_node/Initialization.html). Note that `main()` never returns and
therefore we should not use a return code. Instead, according to the documentation, `scm_boot_guile()` calls `exit(0)`
when the program, i.e. `main_func()` is done.

## Compiling

The project should contain the following files:

    $ ls
    configure.ac 01-setup.c Makefile.in README.md

Use `autoconf` to create `configure`:

    $ autoreconf -vif configure.ac

Run `configure`:

    $ ./configure

Use make to compile and link `01-setup`:

    $ make

## Running

After compiling `01-setup`, run it:

    $ ./01-setup
