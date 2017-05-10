;; Exercise 1.19:
;; A clever algorithm for computing the fibonacci numbers in a log number of steps
;; Read more here: http://community.schemewiki.org/?sicp-ex-1.19

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (even? a)
  (= (remainder a 2) 0))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
         (else (fib-iter (+ (* b q) (* a q) (* a p))
                         (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
