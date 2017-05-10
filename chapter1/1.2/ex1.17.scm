;; Exercise 1.17
;; Multiplication by repeated addition

(define (mult a b)
  (if (= b 0)
      0
      (+ a (mult a (- b 1)))))

(define (even? a)
  (= (remainder a 2) 0))

(define (double a) (+ a a))

(define (half a)
  (cond ((even? a) (/ a 2))))

;; Defining an alternative procedure of (mult a b)
;; which uses a logarithmic number of steps
(define (mult-alt a b)
  (cond ((= b 0) 0)
        ((even? b) (double (mult-alt a (half b))))
        (else (+ a (mult-alt a (- b 1))))))
