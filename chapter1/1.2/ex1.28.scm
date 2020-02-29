;;; (Exercise 1.28) --- Miller-Rabin primality checker

;; A Fermat test that cannot be fooled

;;; Code:
(define (miller-rabin-expmod base exp m)
  "Fermat test variant that can't be fooled"

  (define (square x)
    (* x x))

  (define (squaremod-with-check x)
    (define (check-nontrivial-sqrt x square)
      (if (and (= square 1)
               (not (= x 1))
               (not (= x (- m 1))))
          0
          square))
    (check-nontrivial-sqrt x (remainder (square x) m)))

  (cond ((= exp 0) 1)
        ((even? exp) (squaremod-with-check
                      (miller-rabin-expmod base
                                           (/ exp 2)
                                           m)))
        (else
         (remainder (* base (miller-rabin-expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  "Check if the likelihood of a number being prime"
  (define (try-it a)
    ((lambda (x) (and (not (= x 0)) (= x 1)))
     (miller-rabin-expmod a (- n 1) n)))

  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  "Use the miller-rabin-test to check for primality"
  (cond ((= times 0) #t)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (prime? n)
  "Perform the test n times"
  (fast-prime? n 100))

(define (report-prime n expected)
  "Display the results of primality check"
  (define (report-result n result expected)
    (display n)
    (display ": ")
    (display result)
    (display ": ")
    (display (if (eq? result expected) "OK" "FOOLED"))
    (newline))
  (report-result n (prime? n) expected))

(report-prime 2 #t)
(report-prime 7 #t)
(report-prime 13 #t)
(report-prime 15 #f)
(report-prime 37 #t)
(report-prime 39 #f)

;; Carmichael Numbers
(report-prime 561 #f)
(report-prime 1105 #f)
(report-prime 1729 #f)
(report-prime 2465 #f)
(report-prime 2821 #f)
(report-prime 6601 #f)

;;; Exercise 1.28 ends here
