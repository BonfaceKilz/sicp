;; Exercise 1.41
;; Defining a procedure double that takes a
;; procedure of one argument and returns a
;; procedure that applies the original procedure
;; twice

(define (double f)
  (lambda (x)
    (f (f x))))

;; Example
(define (inc x)(+ x 1))

(((double (double double))inc) 5)
