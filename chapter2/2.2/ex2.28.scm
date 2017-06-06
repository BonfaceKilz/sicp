;; Exercise 2.28
;; Defining a procedure fringe that takes as argument
;; a tree and returns a list whose elements are all
;; leaves of the tree arranged in left-to-right order
(define nil (list))

(define (fringe lst)
  (cond ((null? lst) nil)
        ((not (pair? lst)) (list lst))
        (else (append (fringe (car lst))
                      (fringe (cdr lst))))))

;; test
(define x
  (list (list 1 2) (list 3 4)))
(newline)
(display (fringe x))
(newline)
(display (fringe (list x x)))
