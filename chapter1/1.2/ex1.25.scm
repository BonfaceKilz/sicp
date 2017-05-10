;; Exercise 1.25
;; Analysing 2 different implementations of
;; the expmod algorithm

(load "exponentiantion.scm")

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

;; In this implementation of expmod, the algorithm is continuously
;; doing exponentiation, squaring and modulo.


(define (expmod 2 base exp m)
  (remainder (fast-expt base exp) m))

;; In this implementation using fast-expt, the full result of the
;; exponention is performed after which the modulo operation is
;; performed.


;; Comments:
;; Assume you need to do an exmod with a million digits in it.
;; In the first algorithm, the numbers are "contained" in the
;; sense that squaring, expmod and modulo are being continuously
;; done.
;;
;; However, in the second algorithm where fast-expt is used, the exponent
;; is always calculated. As the digits get larger, more effort is required
;; to operate on them.
;;
;; In conclusion, the second algorithm is more efficient than the first
;; one.
