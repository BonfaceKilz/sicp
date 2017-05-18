;; Exercise 1.36
;; Modifying fixed-point so that it prints
;; the sequence of approximations it
;; generates using the newline and display
;; primitives

;; Calculating fixed points
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
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess)
  )

(define (fn1)
  (fixed-point
   (lambda (x) (/ (log 1000) (log x)))
   10.0))

(define (fn2)
  (define (average a b)
    (/ (+ a b) 2))
  (fixed-point
   (lambda(x) (average x (/ (log 1000) (log x))))
   10.0))
