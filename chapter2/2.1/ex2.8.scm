;; Exercise 2.8
;; Describing how the intervals of two intervals
;; may be computed

(load "ex2.7.scm")
(load "interval-arith.scm")

(define (sub-interval x y)
  (make-interval (- (upper-bound x) (lower-bound y))
                 (- (lower-bound x) (upper-bound y))))

;; Alternatively
(define (sub-interval-alt x y)
  (add-interval x
                (make-interval (- (lower-bound y))
                               (- (upper-bound y)))))
