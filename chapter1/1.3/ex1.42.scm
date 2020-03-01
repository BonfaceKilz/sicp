;;; (Exercise 1.42) --- Defining a composition function

;; Let f and g be one argument functions. The composition f after g is defined
;; to be the function x ↦ f(g(x))

;;; Code:
(define (compose f g)
  (lambda(x)
    (f (g x))))

;; Demo:
(define (square x) (* x x))
(define (cube x) (* x x x))
(define (inc x) (+ x 1))
((compose square inc) 6)
;;; Exercise 1.42 ends here
