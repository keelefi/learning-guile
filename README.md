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
