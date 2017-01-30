;; Exercise 1.5
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; Applicative: A final value is not achieved since the arguments are evaluated first.
