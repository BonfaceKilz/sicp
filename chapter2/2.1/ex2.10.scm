;; Exercise 2.10
;; It's not clear to divide by and interval that spans zero

(load "interval-arith.scm")

(define (div-interval x y)
  (if (or (= (upper-bound y) 0)
          (= (lower-bound y) 0))
      (error "divide by 0 occurs")
      (make-interval
       (/ 1.0 (upper-bound y))
       (/ 1.0 (lower-bound y)))))
