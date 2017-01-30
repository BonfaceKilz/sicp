;; Exercise 1.9
(define (inc x)
  (+ x 1))

(define (dec y)
  (- y 1))

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))
