;; Exercise 2.5
;; Representing pairs of nonnegative numbers
;; using only numbers and arithmetic operations

(define (my-cons x y)
  (*
   (expt 2 x)
   (expt 3 y)))

;; test
(display (my-cons 1 1))
(newline)

(define (divides? a b)
  (= (remainder b a) 0))

(define (my-car z)
  (define (iter x count divisor)
    (if (divides? divisor x)
        (iter (/ x divisor) (+ count 1) divisor)
        count))
  (iter z 0 2))

(define (my-cdr z)
  (define (iter x count divisor)
    (if (divides? divisor x)
        (iter (/ x divisor) (+ count 1) divisor)
        count))
  (iter z 0 3))
