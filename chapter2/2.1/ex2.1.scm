;; Exercise 2.1

;; Defining a better version of make-rat that handles
;; both positive and negative numbers

(load "rational_arith_op.scm")

(define (make-rat-alt n d)
  (if (< d 0)
      (cons (- n) (- d))
      (cons n d)))

;; Tests:
(print-rat (make-rat-alt 1 2))
(print-rat (make-rat-alt -1 2))
(print-rat (make-rat-alt 1 -2))
(print-rat (make-rat-alt -1 -2))
