;; Exercise 2.32

(define nil `())

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda(x)(cons (car s) x)) rest)))))

(newline)
(display (subsets (list 1 2 3)))
(newline)
(display (list 1 2 3 4 5))

;; The set of all subsets of a given set is the union of:
;; (1) the set of all subsets excluding the first number.
;; (2) the set of all subsets excluding the first number, with
;;     the first number re-inserted into each subset.
