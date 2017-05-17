;; Exercise 1.35

;; Showing that the golden ration 𝟇(1.2.2) is a fixed point of
;; transformation x -> 1 + 1/x

(load "fixed-points.scm")

(define (golden-ratio x)
  (fixed-point (lambda (x)
                 (+ 1.0 (/ 1.0 x)))
               1))
