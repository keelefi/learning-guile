# Learning Guile

This repository contains the exercises I have been doing for myself to learn [GNU
Guile](https://www.gnu.org/software/guile/).

The code is heavily inspired by the [Tortoise tutorial](https://www.gnu.org/software/guile/docs/guile-tut/tutorial.html).

All exercises use `autoconf` to build. See the example in the [guile
manual](https://www.gnu.org/software/guile/manual/html_node/A-Sample-Guile-Main-Program.html#Building-the-Example-with-Autoconf).

## 01 - Compiling, linking and REPL

My first exercise was to setup building with `autotools` and to create a simple C program which links `guile` and can
execute Scheme code.

## 02 - Separate script file

In the second exercise, we invoke Scheme code from a separate script file.

## 03 - Call C functions from the script file

In the third exercise, we add a function in the C program and call that function from the script file.

## 04 - SRFI-9 Records

In the fourth exercise, we add SRFI-9 Records into the script file.

## 05 - Using records from C

In the fifth exercise, we call functions generated by the record definition from the C program.

# Extras

## nn-references

Standalone script to test how references work in Scheme / Guile.

## nn-promises

Standalone script to test how promises work in Scheme / Guile.

## nn-promises

Standalone script to test how testing works in Scheme / Guile. We use
[SRFI-64](https://srfi.schemers.org/srfi-64/srfi-64.html) to enable testing.

## nn-exceptions

Standalone script to test how exceptions work in Scheme. As far as I understand, this type of exception raising and
handling is specific to Guile Scheme.

## nn-json

Standalone script to test how [guile-json](https://github.com/aconchillo/guile-json) works.

## nn-reading-files

Read a file in 3 different ways.

## nn-association-lists

Add a function that compares if two association lists are equivalent with each other. This is distinct from `equal?` in
that `equal?` wants the order to be the same for two alists to be equivalent. Instead, our function disregards order
and only cares about contents.
