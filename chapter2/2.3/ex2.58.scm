;; Exercise 2.58

(load "symbolic-differentiation.scm")

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0)
             (=number? m2 0))
         0)
         ((=number? m1 1) m2)
         ((=number? m2 1) m1)
         ((and (number? m1) (number? m2))
          (* m1 m2))
         (else (list m1 '* m2))))

(define (=number? exp num)
(and (number? exp) (= exp num)))
(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (addend s) (car s))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand e)
  (if (not (null? (cadddr e)))
      (cddr e)
      (caddr e)))

(define (augend e)
  (if (not (null? (cadddr e)))
      (cddr e)
      (caddr e)))


;;(define (multiplicand e)
;;  (caddr e))

;;(define (augend e)
;;  (caddr e))
