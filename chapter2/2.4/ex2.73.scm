;; Exercise 2.73
;; A program that perfoms symbolic differentiation

;;(define (deriv exp var)
;;  (cond ((number? exp) 0)
;;        ((variable? exp)
;;         (if (same-variable? exp var) 1 0))
;;        ((sum? exp)
;;         (make-sum (deriv (addend exp) var)
;;                   (deriv (augend exp) var)))
;;        ((product? exp)
;;         (make-sum
;;          (make-product
;;           (multiplier exp)
;;           (deriv (multiplicand exp) var))
;;          (make-product
;;           (deriv (multiplier exp) var)
;;           (multiplicand exp))))
;;        ;; more rules can be added here
;;        (else (error A "unknown expression type: DERIV" exp))))

;; Redefining the above procedure
;;(define (deriv exp var)
;;  (cond ((number? exp) 0)
;;        ((variable? exp)
;;         (if (same-variable? exp var)
;;             1
;;             0))
;;        (else ((get 'deriv (operator exp))
;;               (operands exp)
;;               var))))
;;
;;(define (operator exp) (car exp))
;;(define (operands exp) (cdr exp))

(load "differentiation.scm")
(load "tables.scm")

(define (install-symbolic-differentiator)
  (put 'deriv '+ (lambda (exp var)
                   (make-sum (deriv (addend exp) var)
                             (deriv (augend exp) var))))
  (put 'deriv '- (lambda (exp var)
                   (make-difference (deriv (minuend exp) var)
                                    (deriv (subtrahend exp) var))))
  (put 'deriv '* (lambda (exp var)
                   (make-sum
                    (make-product (multiplier exp)
                                  (deriv (multiplicand exp) var))
                    (make-product (deriv (multiplier exp) var)
                                  (multiplicand exp)))))
  (put 'deriv '** (lambda (exp var)
                    (make-product (exponent exp)
                                  (make-exponentiation
                                   (base exp)
                                   (make-difference (exponent exp))))))
  'done)

(install-symbolic-differentiator)

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else
         ((get 'deriv (operator exp)) (operands exp) var))))

(define (addend a) (car a))
(define (augend a) (cadr a))
(define (minuend a) (car a))
(define (subtrahend a) (cadr a))
(define (multiplier a) (car a))
(define (multiplicand a) (cadr a))
(define (base p) (car p))
(define (exponent p) (cadr p))
