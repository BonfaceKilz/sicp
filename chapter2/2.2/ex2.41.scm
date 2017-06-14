;; Exercise 2.41
;; Writing a procedure that finds all ordered
;; triples of distinct positive integers
;; i, j and k less than or equal to a given
;; integer n that sum to a given integer s

(load "ex2.40.scm")

(define (ordered-triples-sum n s)
  (filter (lambda (l) (= (accumulate + 0 l) s))
          (flatmap
           (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n))))
