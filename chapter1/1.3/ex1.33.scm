;;; (Exercise 1.33) --- Filter function

;; Introducing the notion of a filter on the terms to be combined.

;;; Code:
(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (if (filter a)
                    (term a)
                    null-value)
                (filtered-accumulate filter combiner null-value term (next a) next b))))

(define (filtered-accumulate-iter combiner null-value term a next b filter)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) (combiner result (term a))))
          (else (iter (next a) result))))
  (iter a null-value))

;; Demos:
(define (prime? n)
  "Check whether a number is prime"
  (define (square x) (* x x))

  (define (divides? a b)
    (= (remainder b a) 0))

  (define (smallest-divisor n)
    (find-divisor n 2))

  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n)n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

  (and (not (= n 1))
       (= n (smallest-divisor n))))

(define (sum-prime-squares a b)
  (filtered-accumulate prime? ; filter
                       + ; combiner
                       0 ; null-value
                       (lambda (x) x) ; term
                       a ; first val
                       (lambda (x) (+ 1 x)) ; next function
                       b ; final value
                       ))

(define (product-relative-prime n)
  "Calculate the product of all +ve integers less than n that are relatively
prime to n"
  (define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

  (filtered-accumulate (lambda (x) (= (gcd x n) 1)) ; filter
                       * ; combiner
                       1 ; null-value
                       (lambda (x) x) ; term
                       1 ; first val
                       (lambda (x) (+ 1 x)) ; next function
                       (- n 1) ; final value
                       ))

;;; Exercise 1.33 ends here
