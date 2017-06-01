;; Exercise 2.4
;; Verify that (car (cons x y))
;; yields x for any objects x and y
(define (cons-alt x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

;; Comments: Using the substitution model
;; (car (cons 1 2))
;; (car (lambda (m) (m 1 2)))
;; ((lambda (m)(m 1 2)) (lambda (p q) p))
;; ((lambda (p q) p) 1 2)
;; ((lambda 1 2) 1)
;; 1
;;
;; (cdr (cons 1 2))
;; (cdr (lambda (m) (m 1 2)))
;; ((lambda (m)(m 1 2)) (lambda (p q) q))
;; ((lambda (p q) q) 1 2)
;; ((lambda 1 2) 2)
;; 2
