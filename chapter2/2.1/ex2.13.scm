;; Exercise 2.13
;; Assuming all numbers are positive, and that the percentage tolerances
;; are small, there is a simple formula for the approximate percentage
;; tolerance of the product of the two intervals in terms of the tolerances
;; of the factors.

(load "ex2.12.scm")

(define (percent-tolerance i)
  (let ((center (/ (+ (upper-bound i) (lower-bound i)) 2.0))
        (width (/ (- (upper-bound i) (lower-bound i)) 2.0)))
    (* (/ width center) 100)))

;; tests
(define x (make-center-percent 10 0.5))
(define y (make-center-percent 10 0.4))
(display (percent-tolerance (mul-interval x y)))
