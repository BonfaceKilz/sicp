;; Exercise 2.73
;; A program that perfoms symbolic differentiation

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
        ;; more rules can be added here
        (else (error A "unknown expression type: DERIV" exp))))

;; Redefining the above procedure
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var)
             1
             0))
        (else ((get 'deriv (operator exp))
               (operands exp)
               var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (make-sum a b)
  (list '+ a b))
(define (make-product m1 m2)
  (list '* a b))

(define (install-sum-derivation)
  (define (addend operands)
    (car operands))
  (define (augend operands)
    (cadr operands))
  (define (derive-sum operands var)
    (make-sum (deriv (addend operands) var)
              (deriv (augend operands) var)))
  ;; method of putting the thing in the table
  (put '+ 'deriv derive-sum))

(define (install-product-derivation)
  (define (multiplier operands)
    (car operands))
  (define (multiplicand operands)
    (cadr operands))
  (define (derive-product operands var)
    (make-sum
     (make-product (multiplier operands)
                   (deriv (multiplicand operands) var))
     (make-product (multiplicand operands)
                   (deriv (multiplier operands) var))
     var))
    ;; put that into the table
  (put '* 'deriv derive-product))

(define install-exponent-derivation
  (define (power operands)
    (cadr operands))
  (define (base operands)
    (car operands))
  (define (make-exponent b p)
    (list '** b p))
  (define (derive-exponent operands var)
    (make-product
     (make-product (power operands)
                   (make-exponent (base operands) (- (power operands) 1)))
     (deriv (base operands) var)))
  (put '** 'deriv derive-exponent))
