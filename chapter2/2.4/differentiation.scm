;;
;; Procedures for performing symbolic differentiation:
;;

;;
;; Procedures for object identification:
;;
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num)
  (and (number? exp) (= exp num)))

;;
;; Procedures for handling sums:
;;
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s) (caddr s))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else
          (list '+ a1 a2))))

;;
;; Procedures for handling products:
;;
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else
          (list '* m1 m2))))

;;
;; Procedures for handling differences:
;;
(define (difference? x)
  (and (pair? x) (eq? (car x) '-)))
(define (minuend p) (cadr p))
(define (subtrahend p) (caddr p))
(define (make-difference s1 s2)
  (cond ((=number? s2 0) s1)
        ((=number? s1 0) (make-product -1 s2))
        ((and (number? s1) (number? s2)) (- s1 s2))
        (else
          (list '- s1 s2))))

;;
;; Procedures for handling exponentiation:
;;
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**) (variable? (cadr x))))
(define (base p) (cadr p))
(define (exponent p) (caddr p))
(define (make-exponentiation base exp-value)
  (cond ((and (number? base) (number? exp-value)) (expt base exp-value))
        ((=number? exp-value 0) 1)
        ((=number? exp-value 1) base)
        (else
          (list '** base exp-value))))

;;
;; Define the "deriv" procedure:
;;
(define (deriv expression var)

  (cond
   ((number? expression) 0)

   ((variable? expression)
    (if (same-variable? expression var) 1 0))

   ((sum? expression)
    (make-sum (deriv (addend expression) var)
                    (deriv (augend expression) var)))

   ((difference? expression)
    (make-difference (deriv (minuend expression) var)
                          (deriv (subtrahend expression) var)))

   ((product? expression)
    (make-sum
     (make-product (multiplier expression)
                      (deriv (multiplicand expression) var))
     (make-product (deriv (multiplier expression) var)
                      (multiplicand expression))))

   ((exponentiation? expression)
    (make-product
     (exponent expression)
     (make-exponentiation
      (base expression)
      (make-difference (exponent expression) 1))))

   (else
(error "Unknown expression type -- DERIV" expression))))
