;; Exercise 2.19
;; Modifying the change-counting program of 1.2.2

(load "lists.scm")
(load "ex2.18.scm")

(define us-coins
  (list 50 25 10 5 1))

(define uk-coins
  (list 100 50 20 10 5 2 1 0.5))

(define (first-denomination x)
  (car x))

(define (except-first-denomination x)
  (cdr x))

(define (no-more? x)
  (null? x))

(define (cc amount coin-values)
  (cond ((= amount 0)`
         1)
        ((or (< amount 0)
             (no-more? coin-values))
         0)
        (else
         (+ (cc
             amount
             (except-first-denomination
              coin-values))
            (cc
             (- amount
                (first-denomination
                 coin-values))
             coin-values)))))

;; Tests
(display (cc 100 us-coins))
(newline)
(display (cc 100 (reverse us-coins)))
(newline)

;; comments
;; order does not affect the answer produces
;; by cc
