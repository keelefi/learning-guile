#!/usr/bin/guile -s
!#

(use-modules (srfi srfi-64))

(include "association-lists.scm")

(test-begin "alist-equal-tests")

;;; empty alist tests
(test-assert "empty alists are equal" (alist-equal? '() '()))
(test-assert "empty alist not equal to non-empty" (not (alist-equal? '() '(("a" . "1")))))
(test-assert "non-empty alist not equal to empty alist" (not (alist-equal? '(("a" . "1")) '())))

;;; single entry tests
(define single-entry-a-1 '(("a" . "1")))
(define single-entry-a-2 '(("a" . "2")))
(define single-entry-b-1 '(("b" . "1")))
(test-assert "single entry alists are equal" (alist-equal? single-entry-a-1 single-entry-a-1))
(test-assert "single entry a-1 and a-2 are not equal" (not (alist-equal? single-entry-a-1 single-entry-a-2)))
(test-assert "single entry a-1 and b-1 are not equal" (not (alist-equal? single-entry-a-1 single-entry-b-1)))

;;; dual entry tests
(define dual-entry-a-1-b-1 '(("a" . "1") ("b" . "1")))
(define dual-entry-b-1-a-1 '(("b" . "1") ("a" . "1")))
(define dual-entry-a-1-b-2 '(("a" . "1") ("b" . "2")))
(define dual-entry-b-2-a-1 '(("b" . "2") ("a" . "1")))
(test-assert "dual entry alists are equal" (alist-equal? dual-entry-a-1-b-1 dual-entry-a-1-b-1))
(test-assert "dual entry alists reversed are equal" (alist-equal? dual-entry-a-1-b-1 dual-entry-b-1-a-1))
(test-assert "dual entry alists reversed are equal b=2" (alist-equal? dual-entry-a-1-b-2 dual-entry-b-2-a-1))
(test-assert "dual not equal to single" (not (alist-equal? dual-entry-a-1-b-1 single-entry-a-1)))
(test-assert "dual not equal to single b" (not (alist-equal? dual-entry-a-1-b-1 single-entry-b-1)))
(test-assert "single not equal to dual" (not (alist-equal? single-entry-a-1 dual-entry-a-1-b-1)))
(test-assert "single not equal to dual b" (not (alist-equal? single-entry-b-1 dual-entry-a-1-b-1)))

;;; nested alist tests
(define nested-alist-a-x-1 '(("a") . (("x" . "1"))))
(define nested-alist-a-x-2 '(("a") . (("x" . "2"))))
(define nested-alist-b-x-1 '(("b") . (("x" . "1"))))
(test-assert "nested alists are equal" (alist-equal? nested-alist-a-x-1 nested-alist-a-x-1))
(test-assert "nested alists are not equal" (not (alist-equal? nested-alist-a-x-1 nested-alist-a-x-2)))
(test-assert "nested alists are not equal b" (not (alist-equal? nested-alist-a-x-1 nested-alist-b-x-1)))

;;; nested dual entry tests
(define nested-dual-a-x-1-y-1 '(("a") . (("x" . "1") ("y" . "1"))))
(define nested-dual-a-x-1-y-2 '(("a") . (("x" . "1") ("y" . "2"))))
(define nested-dual-a-y-1-x-1 '(("a") . (("y" . "1") ("x" . "1"))))
(test-assert "nested dual alists are equal" (alist-equal? nested-dual-a-x-1-y-1 nested-dual-a-x-1-y-1))
(test-assert "nested dual alists reversed are equal" (alist-equal? nested-dual-a-x-1-y-1 nested-dual-a-y-1-x-1))
(test-assert "nested dual alists are not equal" (not (alist-equal? nested-dual-a-x-1-y-1 nested-dual-a-x-1-y-2)))
(test-assert "nested dual alists reversed are not equal" (not (alist-equal? nested-dual-a-y-1-x-1 nested-dual-a-x-1-y-2)))

;;; nested deep 3 tests
(define nested-deep-a-x-i-1 '(("a") . (("x") . (("i" . "1")))))
(define nested-deep-a-x-i-1-j-1 '(("a") . (("x") . (("i" . "1") ("j" . "1")))))
(define nested-deep-a-x-j-1-i-1 '(("a") . (("x") . (("j" . "1") ("i" . "1")))))
(test-assert "nested deep 3 alists are equal" (alist-equal? nested-deep-a-x-i-1 nested-deep-a-x-i-1))
(test-assert "nested deep 3 alists are equal j" (alist-equal? nested-deep-a-x-i-1-j-1 nested-deep-a-x-i-1-j-1))
(test-assert "nested deep 3 alists reversed are equal" (alist-equal? nested-deep-a-x-i-1-j-1 nested-deep-a-x-j-1-i-1))

;;; jobs test
(define job-a-job-b '(("jobA" ("before" . #("jobB"))) ("jobB" ("after" . #("jobA")))))
(define job-b-job-a '(("jobB" ("after" . #("jobA"))) ("jobA" ("before" . #("jobB")))))
(test-assert "job a before equals job b after" (alist-equal? job-a-job-b job-b-job-a))

(test-end "alist-equal-tests")

(test-begin "alist-equal-tests-2")

;;; empty list tests
(test-equal "empty lists are equal" '() '())
(test-assert "empty list not equal to non-empty" (not (equal? '() '(("a" . "1")))))
(test-assert "non-empty list not equal to empty list" (not (equal? '(("a" . "1")) '())))

;;; single entry tests
(test-equal "single entry lists are equal" single-entry-a-1 single-entry-a-1)
(test-assert "single entry a-1 and a-2 are not equal" (not (equal? single-entry-a-1 single-entry-a-2)))
(test-assert "single entry a-1 and b-1 are not equal" (not (equal? single-entry-a-1 single-entry-b-1)))

;;; dual entry tests
(test-equal "dual entry lists are equal" dual-entry-a-1-b-1 dual-entry-a-1-b-1)
(test-equal "dual entry lists reversed are equal" dual-entry-a-1-b-1 dual-entry-b-1-a-1)
(test-equal "dual entry lists reversed are equal b=2" dual-entry-a-1-b-2 dual-entry-b-2-a-1)
(test-assert "dual not equal to single" (not (equal? dual-entry-a-1-b-1 single-entry-a-1)))
(test-assert "dual not equal to single b" (not (equal? dual-entry-a-1-b-1 single-entry-b-1)))
(test-assert "single not equal to dual" (not (equal? single-entry-a-1 dual-entry-a-1-b-1)))
(test-assert "single not equal to dual b" (not (equal? single-entry-b-1 dual-entry-a-1-b-1)))

;;; nested alist tests
(test-equal "nested lists are equal" nested-alist-a-x-1 nested-alist-a-x-1)
(test-assert "nested lists are not equal" (not (equal? nested-alist-a-x-1 nested-alist-a-x-2)))
(test-assert "nested lists are not equal b" (not (equal? nested-alist-a-x-1 nested-alist-b-x-1)))

;;; nested dual entry tests
(test-equal "nested dual lists are equal" nested-dual-a-x-1-y-1 nested-dual-a-x-1-y-1)
(test-equal "nested dual lists reversed are equal" nested-dual-a-x-1-y-1 nested-dual-a-y-1-x-1)
(test-assert "nested dual lists are not equal" (not (equal? nested-dual-a-x-1-y-1 nested-dual-a-x-1-y-2)))
(test-assert "nested dual lists reversed are not equal" (not (equal? nested-dual-a-y-1-x-1 nested-dual-a-x-1-y-2)))

;;; nested deep 3 tests
(test-assert "nested deep 3 alists are equal" (equal? nested-deep-a-x-i-1 nested-deep-a-x-i-1))
(test-assert "nested deep 3 alists are equal j" (equal? nested-deep-a-x-i-1-j-1 nested-deep-a-x-i-1-j-1))
(test-assert "nested deep 3 alists reversed are equal" (equal? nested-deep-a-x-i-1-j-1 nested-deep-a-x-j-1-i-1))

;;; jobs test
(test-assert "job a before equals job b after" (equal? job-a-job-b job-b-job-a))

(test-end "alist-equal-tests-2")

