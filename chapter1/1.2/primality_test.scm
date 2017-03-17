;; This program finds the smallest integral divisor
;; of a given number n. It does this by testing n for
;; divisibility by successive integers starting with 2

(define (square x) (* x x))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

;; example: (smallest-divisor 15)
;; (find-divisor 15 2)
;; (find-divisor 15 3)

;; We can test primality as follows:
(define (prime? n)
  (= n (smallest-divisor n)))

;; Comments:
;; The number of steps required to identify n as prime will have
;; order of growth of 𝟅(√n)
