;; Exercise 1.7
(define (average x y)
  (/ (+ x y) 2))

(define (abs x)
  (cond ((< x 0) (- x))
	(else x)))

(define (improve guess x)
  (average guess (/ x guess)))

;; Modified version of good-enough
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))
