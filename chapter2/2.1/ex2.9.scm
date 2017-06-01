;; Exercise 2.9
;; width = average(upperbound, lowerbound)

(load "interval-arith.scm")

(define (average x y) (/ (+ x y) 2))

(define (width-interval interval)
   (/ (- (upper-bound interval) (lower-bound interval)) 2.00))

;; Showing that the width of the sum of 2 intervals
;; is a function of only the widths of the intervals
;; being added
(define interval1 (cons 5.5 4.5))
(define interval2 (cons 10.5 9.5))
(newline)
(display (add-interval interval1 interval2))
(newline)
(display (width-interval
         (add-interval interval1 interval2)))
(newline)
;; Proof
(display (+ (width-interval interval1) (width-interval interval2)))
(newline)

;; This is not however true for multiplication
;; The ans should be 7.5
(display (mul-interval interval1 interval2))
(newline)
(display(width-interval
         (mul-interval interval1 interval2)))
;; However the answer is 1 as previously demonstrated
