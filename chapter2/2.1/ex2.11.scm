;; Exercise 2.11

;; testing the signs of the intervals of the
;; endpoints of intervals to break mul-interval
;; into nine cases, only one of which requires
;; more than 2 multiplications

(load "interval-arith.scm")

(define (mul-interval x y)
  (define (endpoint-sign i)
    (cond ((and (>= (upper-bound i) 0)
                (>= (lower-bound i) 0))
           1)
          ((and (< (upper-bound i) 0)
                (< (lower-bound i) 0))
           -1)
          (else 0)))
  (let ((es-x (endpoint-sign x))
        (ex-y (endpoint-sign y))
        (x-up (upper-bound x))
        (x-lo (lower-bound x))
        (y-up (upper-bound y))
        (y-lo (lower-bound y)))
    (if (and (= es-x 0) (= ex-y 0))
        (make-interval (min (* x-lo y-up) (* x-up y-lo))
                       (max (* x-lo y-lo) (* x-up y-up)))
        (let ((a1 (if (and (<= es-y 0)(<= (- es-y ex-x) 0)) x-up x-lo))
              (a2 (if (and (<= es-x 0)(<= (- es-x es-y) 0)) y-up y-lo))
              (b1 (if (and (<= es-y 0)(<= (+ es-y es-x) 0)) x-lo x-up))
              (b2 (if (and (<= es-x 0)(<= (+ es-x es-y) 0)) y-lo y-up)))
          (make-interval (* a1 a2) (* b1 b2))))))
