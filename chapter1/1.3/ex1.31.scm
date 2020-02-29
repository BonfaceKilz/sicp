;;; (Exercise 1.31) --- Factorial/ Calculating PI

;; Using a generic product procedure to calculate the factorial of a number and
;; the value of PI Returns the product of a function at points over a given

;;; Code:
(define (product f a next b)
  "Calculate the product using a recursive process"
  (if (> a b)
      1
      (* (f a)
         (product f (next a) next b))))

(define (product-iter f a next b)
  "Calculate the product using an iterative process"
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (f a)))))
  (iter a 1))

(define (factorial n)
  "Get the factorial of a number"
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(define (pi n)
  "Approximate the value of PI"
  (define (square x) (* x x))
  (define (next x) (+ x 2))
  (* 4.0 (/
          (* 2 (product square 4 next (- n 2)) n)
          (product square 3 next n))))
;;; Exercise 1.31 ends here
