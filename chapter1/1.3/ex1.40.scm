;; Exercise 1.40
;; Cubic procedure which can be used together with
;; newtons-method procedure in expressions of the
;; form (newtons-method (cubic a b c) 1)

(load "newton-method.scm")

(define (cubic a b c)
  (define (cube x) ( * x x x))
  (define (square x) ( * x x))
  (lambda(x)
    (+ (cube x)
       (* a (square x ))
       (* b x)
       c)))

(newtons-method (cubic 1 1 1) 1)
