;; Exercise 1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; Using the new-if leads to a maximum recursion depth
;; Infinite recursion because the new-if uses the applicative order
;; of evaluation
