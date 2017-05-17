;; Exercise 1.30
;; Iterative form of the sum function

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-alt term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)(+ result (term a)))))
  (iter a 0))

;; Test
(define (cube x) (* x x x))
(define (inc x) (+ x 1))
