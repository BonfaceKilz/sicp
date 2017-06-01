;; Exercise 2.7
;; Defining make-interval, upper-bound and
;; lower-bound

(define (make-interval a b) (cons a b))

(define (upper-bound num)
  (if (> (car num) (cdr num))
      (car num)
      (cdr num)))

(define (lower-bound num)
  (if (< (car num) (cdr num))
      (car num)
      (cdr num)))
