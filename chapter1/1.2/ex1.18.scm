;; Exercise 1.18
;; Generating an iterative process for multiplying
;; two integers in terms of adding, doubling, and
;; halving.

(define (double a ) (+ a a))

(define (half a)
  (cond ((even? a) (/ a 2))))

(define (mult a b)
  (mult-iter a b 0))

(define (even? a)
  (= (remainder a 2) 0))

(define (odd? a)
  (not (even? a)))

;; Normal iteration
(define (mult-iter a counter sum)
  (if (= counter 0)
      sum
      (mult-iter a
                 (- counter 1)
                 (+ a sum))))

;; Logarithmic iteration
;; Also known as the Russian Peasant method
(define (mult-alt a b)
  (mult-iter a b 0))

(define (mult-alt-iter a counter sum)
  (cond ((= counter 0) sum)
        ((even? counter)
         (mult-iter a
                    (- counter 2)
                    (double (+ a (half sum)))))
        ((odd? counter)
         (mult-iter a
                    (- counter 1)
                    (+ a sum)))))
