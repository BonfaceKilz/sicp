;; Exercise 1.8
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess))
     3)
  )
(define (cube x)
  (* x x x))

(define (abs x)
  (cond ((< x 0) (- x))
	(else x)))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x)
	      x)))

(define (cubert x)
  (cubert-iter 1.0 x))
