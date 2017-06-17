;; Exercise 2.59
;; Implementing the union-set operation
;; for the unordered-list representation
;; of sets

(load "representing-sets.scm")

(define (union-set set1 set2)
  (if (null? set2)
      set1
      (union-set (adjoin-set (car set2) set1)
                 (cdr set2))))

;; alternate cool solution
(define (union-set-alt s1 s2)
  (append s1 (filter (lambda (x)
                       (not (element-of-set? x s1)))
                     s2)))
;; test
(define odds (list 1 3 5))
(define evens (list 0 2 4 6))
(union-set evens odds)
