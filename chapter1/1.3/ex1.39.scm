;; Exercise 1.39
;; Continued fraction representation
;; of the tangential function

(load "ex1.37.scm")

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (- (* x x))))
             (lambda(i)
               (- (* i 2) 1.0))
             k))
