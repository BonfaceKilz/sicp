;;; (Exercise 1.41) --- Approximating zeros of cubic functions

;; Defining a procedure double that takes a procedure of one argument and
;; returns a procedure that applies the original procedure twice

;;; Code:
(define (double f)
  (lambda (x)
    (f (f x))))

;; Demo:
(define (inc x)(+ x 1))
(display ((double (double inc)) 1))
;;; Exercise 1.41 ends here
