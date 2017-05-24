;; Exercise 1.43
;; Writing a program that applies itself repeatedly

(load "ex1.42.scm")

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated  f (- n 1)))))

(define (square x) (* x x))

((repeated square 2) 5)
