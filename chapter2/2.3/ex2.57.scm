;; Exercise 2.57
;; Extending the differentiation program
;; to handle sums and products of arbitrary
;; numbers of two or more terms

;; (deriv '(* (* x y) (+ x 3)) 'x)
;; (+ (* x y) (* y (+ x 3)))
(load "symbolic-differentiation.scm")

(define (multiplicand e)
  (if (not (null? (cadddr e)))
      (cons '* (cddr e))
      (caddr e)))

(define (augend e)
  (if (not (null? (cadddr e)))
      (cons '+ (cddr e))
      (caddr e)))
