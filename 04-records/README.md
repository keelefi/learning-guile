# 04-records

In this exercise we create an SRFI-9 Record in our Scheme code. The basic idea for the record is taken from the [Guile
manual](https://www.gnu.org/software/guile/manual/html_node/SRFI_002d9-Records.html). We create a record holding
employee data. Note that we create a custom constructor for the record which accepts optional keywords and parameters.

## Compiling

The project should contain the following files:

    $ ls
    04-records.c configure.ac Makefile.in README.md script.scm

Use `autoconf` to create `configure`:

    $ autoreconf -vif configure.ac

Run `configure`:

    $ ./configure

Use make to compile and link `04-records`:

    $ make

## Running

After compiling `04-records`, run it:

    $ ./04-records
