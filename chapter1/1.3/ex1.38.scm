;; Exercise 1.38
;; De Fractionibus Continuis

(load "ex1.37.scm")

(define (numerator k)
  (+ 1))

(define (denominator k)
  (if (= (remainder (+ k 1) 3) 0)
      (/ (+ k 1) 1.5)
      1))

(define (euler k)
  (+ 2.0 (cont-frac numerator denominator k)))
