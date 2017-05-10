;; Exercise 1.16
;; Designing a procedure that evolves an iterative exponentiation
;; process

(define (fast-expt b n)
  (define (even? p)
    (= (remainder p 2) 0))
  (define (square x) (* x x))
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))
