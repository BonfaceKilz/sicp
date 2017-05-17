;; Exercise 1.31
;; Product procedure
;; Returns the product of a function at points over
;; a given range

;; Recursive
(define (product f a next b)
  (if (> a b)
      1
      (* (f a)
         (product f (next a) next b))))

;; Iterative
(define (product-alt f a next b)
  (define (iter n result)
    (if (> a b)
        result
        (iter (next a) (* result (f a)))))
  (iter a 1))

(define (cube x)
  (* x x x))

(define (inc n)
  (+ n 1))

(define (factorial n)
  (product (lambda (x) x) 1 inc n))

(define (pi n)
  (define (square x) (* x x))
  (define (next x) (+ x 2))
  (* 4.0 (/
          (* 2 (product square 4 next (- n 2)) n)
          (product square 3 next n))))
