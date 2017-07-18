;; Exercise 2.65
;; Giving a 𝟅(n) implementation of union-set
;; and intersection set for sets represented
;; as binary trees
(load "ex2.63.scm")
(load "ex2.64.scm")

(define (union-set tree1 tree2)
  (list->tree (union-set-list (tree->list tree1)
                              (tree->list tree2))))
