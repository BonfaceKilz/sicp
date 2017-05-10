(define (average-damp f)
  (define (average a b) (/ (+ a b) 2))
  (lambda (x) (average x (f x))))
(define (square x) (* x x))

;; Example usage:
((average-damp square) 10)

(define (positive? a)
  (> a 0))
(define (abs x)
  (if (positive? x)
      x
      (- x)))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; Redefining sqrt again
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

;; Redefining cubert
(define (cube-root x)
  (define (square x) (* x x))
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))
