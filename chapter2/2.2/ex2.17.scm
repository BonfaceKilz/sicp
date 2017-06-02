;; Exercise 2.17
;; Defining a procedure last-pair that returns the
;; list that contains only the last element of a
;; given nonempty list

(load "lists.scm")

(define (last-pair n)
  (list-ref n (- (length n) 1)))

;; test
(display (last-pair (list 23 72 149 34)))
