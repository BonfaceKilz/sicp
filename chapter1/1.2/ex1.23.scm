;; Exercise 1.23
;; Modifying the smallest-divisor to make it more
;; efficient by skipping even numbers greater
;; than 2

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next n)
  (cond ((= n 2) 3)
        (else (+ n 2))))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
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
