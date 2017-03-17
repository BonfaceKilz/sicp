;; Exercise 1.11
;; f(n) = n if n < 3
;; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3

;; Using a recursive process
(define (f x)
  (cond ((< x 3) x)
	(else (+ (f (- x 1))
		 (* 2 (f (- x 2)))
		 (* 3 (f (- x 3)))
		 ))))


;; Using an iterative process
(define (f_alt n)
  (cond ((< n 3) n)
	(else (f-iter 0 1 2 (- n 2)))))
(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))

