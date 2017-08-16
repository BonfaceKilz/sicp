;; Exercise 3.1

;; An accumulator is a procedure that is called
;; repeatedly with a single numeric argument and
;; accumulates its argument into a sum. Each time
;; it is called, it returns the currently accumulated
;; sum. Write a procedure make-accumulator that
;; generates accumulators, each maintaining an
;; independent sum. The input to make-accumulator
;; should specify the initial value of the sum; for

(define (make-accumulator sum)
  (lambda (amount)
    (begin (set! sum
             (+ amount sum))
           sum)))

;; Tests:
(define A (make-accumulator 5))
(display (A 10))
;; 15

(display (A 10))
;; 25
