;; Exercise 2.12
;; Defining a make-center-percent method

(load "interval-arith.scm")

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))

(define (width i)
  (/ (- (upper-bound i)
        (lower-bound i))
     2))

(define (make-center-percent c w)
  (make-interval (- c (* c (* w 0.01)))
                 (+ c (* c (* w 0.01)))))

;; Test
(define z (make-center-percent 100 10))
(display z)
