;; Exercise 3.19

;; Redo Exercise 3.18 using an algorithm that takes only a constant
;; amount of space

;; Using Floyd's cycle-finding algorithm

(define (cycle? x)
  (define (run tortoise hare)
    (cond ((null? tortoise)
           #f)
          ((null? hare)
           #f)
          ((null? (cdr hare))
           #f)
          ((null? (cddr hare))
           #f)
          ((eq? (car tortoise) (car hare))
           #t)
          (else
           (run (cdr tortoise) (cddr hare)))))
  (run x (cdr x)))
