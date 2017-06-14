;; Exercise 2.56
;; Extending deriv to handle exponents

(load "symbolic-differentiation.scm")

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product
           (multiplier exp)
           (deriv (multiplicand exp) var))
          (make-product
           (deriv (multiplier exp) var)
           (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (exponent exp)
          (make-product
           (make-exponentiation
            (base exp) (- (exponent x) 1))
           (deriv
            (make-exponentiation
             (base exp) 1)
            var))))
        (else (error "unknown expression type: DERIV" exp))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (make-exponentiation base exponent)
  (cond ((=number? base 0) 0)
        ((=number? exponent 1) base)
        ((or (=number? exponent 0)
             (=number? base 1)) 1)
        (else (list '** base exponent))))

(define (base x) (cadr x))

(define (exponent x) (caddr x))

;; Tests
(newline)
(display (deriv '(** x 2) 'x))
