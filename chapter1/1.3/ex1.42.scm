;; Exercise 1.42
;; Defining a composition function

(define (compose f g)
  (lambda(x)
    (f (g x))))

;; demo
(define (square x) (* x x))
(define (cube x) (* x x x))
(define (inc x) (+ x 1))
((compose square inc) 6)
