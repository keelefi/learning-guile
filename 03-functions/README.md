# 03-functions

In this exercise we create a C function, `factorial()` which we expose for our script file to use. To expose the
function, we use `scm_c_define_gsubr()`:

    SCM scm_c_define_gsubr (const char *name, int req, int opt, int rst, fcn)

`name` is the symbol name which is used from Scheme code to address this function. `req`, `opt` and `rst` are amount of
required, optional and rest parameters the function expects, respectively. `fcn` is the function to expose.

Within our function `factorial()`, we have to convert the input parameter from `SCM` type to `unsigned int`. Guile
provides functions to verify the input parameter is indeed an integer. For example, we could use `scm_is_integer()`, or
better yet, `scm_is_unsigned_integer()`. The latter does boundaries checking, too. However, we can just directly use
`scm_to_uint()` which, per documentation, will throw an error if the type is invalid. As we would fail our program
anyhow, this is acceptable for us.

After we have done our calculus, we still need to convert the result to type `SCM`. In this case, we can use
`scm_from_uint()`.

## Compiling

The project should contain the following files:

    $ ls
    03-functions.c configure.ac Makefile.in README.md script.scm

Use `autoconf` to create `configure`:

    $ autoreconf -vif configure.ac

Run `configure`:

    $ ./configure

Use make to compile and link `03-functions`:

    $ make

## Running

After compiling `03-functions`, run it:

    $ ./03-functions
