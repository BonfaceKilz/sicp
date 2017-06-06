;; Exercise 2.30
(define (square-tree tree)
  (define (square x) (* x x))
  (map (lambda(sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (square sub-tree)))
       tree))

(newline)
(display (square-tree
          (list 1
                (list 2 (list 3 4) 5)
                (list 6 7))))
