;; Exercise 1.32
;; Showing that both sum and product
;; are more general forms of the
;; accumulate function

;; Testing the accumulator function
;; by writing the sum function in terms of it

;; Here's the sum function:
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum cube (next a) next b))))

(define (inc n)
  (+ n 1))

(define (cube x)
  (* x x x))


;; Defining the accumulate function
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum-alt term a next b)
  (accumulate + 0 term a next b))

(define (product-alt term a next b)
  (accumulate * 1 term a next b))
