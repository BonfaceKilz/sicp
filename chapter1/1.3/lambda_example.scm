(define (square x) (* x x))

(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b))
    (f-helper (+ 1 (* x y))
              (- 1 y))))

;; Using the lambda function
(define (f-1 x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

;; Using Let
;; Example 1:
(+ (let ((x 3))
     (+ x (* x 10)))
   5)
;; Ans: 38

(let ((x 3)
      (y (+ 2 2)))
  (* x y))
;; Ans: 12
