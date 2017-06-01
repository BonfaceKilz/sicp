;; Exercise 2.7
;; Defining make-interval, upper-bound and
;; lower-bound

(define (make-interval a b) (cons a b))

(define (upper-bound num) (car num))

(define (lower-bound num) (cdr num))
