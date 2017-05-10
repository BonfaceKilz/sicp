;; Exercise 1.22

(load "ex1.23.scm")

(define (report-prime elapsed-time n)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time) n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (search-for-primes a b)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (search-iter cur last)
    (if (<= cur last) (timed-prime-test cur))
    (if (<= cur last) (search-iter (+ cur 2) last)))
  (search-iter (if (even? a) (+ a 1) b)
               (if (even? b) (-b 1) b)))
