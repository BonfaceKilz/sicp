;; Computing gcd

;; Using Euclid's algorithm
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; Comments:
;; This procedure produces an iterative process
;; whose number of steps grows as the logarithm of the
;; numbers involved
