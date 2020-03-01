;;; (Exercise 1.43) --- nth repeated application of a function

;; Writing a program that applies itself repeatedly

;;; Code:
(define (repeated f n)
  (define (compose f g)
    (lambda(x)
      (f (g x))))

  (if (= n 1)
      f
      (compose f (repeated  f (- n 1)))))

(define (square x) (* x x))

;; Demo:
((repeated square 2) 5)
;;; Exercise 1.43 ends here
