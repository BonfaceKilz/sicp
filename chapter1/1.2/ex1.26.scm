;; Exercise 1.26
;; Analysing expmod

(define (even? x)
  (= (remainder x 2) 0))

(define (exmpod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m)
                       m))
         (else
          (remainder (* base (expmod base (- exp 1) m))
                     m)))))

;; Scheme does operations using applicative order, so in this
;; implementation, expmod is performed twice. In the original
;; implementation, this implementation was done and it took up
;; a 𝟅 (log n) time. Halving the problem but doubling the calls
;; cancels each other and thus in we have 𝟅 (n) in this
;; algorithm
