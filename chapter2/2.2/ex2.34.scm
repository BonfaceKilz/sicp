;; Exercise 2.34
;; Evaluating a polynomial in x at a given value of x
;; using Horner's rule

(load "seq-interfaces.scm")

(define
  (horner-eval x coefficient-sequence)
  (accumulate
   (lambda (this-coeff higher-terms)
     (+ this-coeff (* x higher-terms)))
   0
   coefficient-sequence))

;; test
(newline)
(display (horner-eval 2 (list 1 3 0 5 0 1)))
