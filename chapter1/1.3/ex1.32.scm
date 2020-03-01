;;; (Exercise 1.32) --- Accumulate function

;; Showing that both sum and product are special cases of the accumulate
;; function that combines a collection of terms, using some general accumulation
;; function

;;; Code:

(define (accumulate combiner null-value term a next b)
  "Accumulate function that generates a recursive process"
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  "Accumulate function that generates an iterative process"
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

;; Special cases of functions using an accumulator that generates a recursive
;; process
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

;; Special cases of functions using an accumulator that generates an iterative
;; process
(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

;;; Demo
(define (cube x) (* x x x))
(define (inc x) (+ x 1))

(display (sum cube 1 inc 2))
(newline)
(display (sum-iter cube 1 inc 2))
(newline)

(display (product cube 1 inc 2))
(newline)
(display (product-iter cube 1 inc 2))
(newline)
;;; Exercise 1.32 ends here
