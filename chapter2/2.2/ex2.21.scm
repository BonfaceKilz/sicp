;; Exercise 2.21
;; a procedure that returns the square of lists

(load "mapping-lists.scm")

(define (square n)(* n n))
(define (square-list-old items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square-list items)
  (map square items))
