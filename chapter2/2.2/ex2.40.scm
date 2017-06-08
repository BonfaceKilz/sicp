;; Exercise 2.40
;; Defining unique-pairs and re-writing
;; prime-sum-pairs with it

(load "nested-mappings.scm")

(define (unique-pairs n)
  (accumulate
   append
   nil
   (map (lambda (i)
          (map (lambda (j)
                 (list i j))
               (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n))))

(define (prime-sum-pairs-alt n)
  (map make-pair-sum
       (filter
        prime-sum?
        (unique-pairs n))))
