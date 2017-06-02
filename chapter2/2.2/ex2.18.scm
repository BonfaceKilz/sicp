;; Exercise 2.18
;; Defining a procedure reverse that takes a
;; list as argument and returns the list of
;; the same elements in reverse order

(load "lists.scm")

(define (reverse lst)
  (define len (length lst))
  (define new-lst (list))
  (define (lst-iter new-lst count)
    (if (= count len)
        new-lst
        (lst-iter (append
                   (list (list-ref lst count))
                   new-lst)
                  (+ count 1))
        ))
  (lst-iter new-lst 0))
