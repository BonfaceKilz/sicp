;; Mapping over trees

(define nil `())

(define (scale-tree tree factor)
  (cond ((null? tree) nil)
        ((not (pair? tree))
         (* tree factor))
        (else
         (cons (scale-tree (car tree)
                           factor)
               (scale-tree (cdr tree)
                           factor)))))

;; test
(newline)
(display (scale-tree (list 1
                           (list 2 (list 3 4) 5)
                           (list 6 7))
         10))

;; alternative way
(define (scale-tree-alt tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree-alt sub-tree factor)
             (* sub-tree factor)))
       tree))

;; test
(newline)
(display (scale-tree-alt (list 1
                           (list 2 (list 3 4) 5)
                           (list 6 7))
         10))
