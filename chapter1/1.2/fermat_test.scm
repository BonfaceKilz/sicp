;; Fermat Test

;; This procedure computes the exponential of a number
;; modulo another number
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (- exp 1) m))
                    m))))

;; The Fermat test
(define (fermat-test)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

;; A probabilistic way of checking for prime numbers
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
