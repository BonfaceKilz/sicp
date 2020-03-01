;;; (Exercise 1.40) --- Approximating zeros of cubic functions

;; Cubic procedure which can be used together with newtons-method procedure in
;; expressions of the form (newtons-method (cubic a b c) 1)

;;; Code:
(define (newtons-method g guess)
  (define (deriv g)
    (define dx 0.00001)
    (lambda (x)
      (/ (- (g (+ x dx)) (g x))
         dx)))
  (define (newton-transform g)
    (lambda (x)
      (- x (/ (g x) ((deriv g) x)))))
  (define (fixed-point f first-guess)
    (let ((tolerance 0.00001))
      (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))

      (define (try guess)
        (display guess)
        (newline)
        (let ((next (f guess)))
          (if (close-enough? guess next)
              next
              (try next))))

      (try first-guess)))
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  "Approximate zeros of the cubic: x^3 + ax^2 + bx + c"
  (lambda(x)
    (+ (* x x x)
       (* a (* x x))
       (* b x)
       c)))

(newtons-method (cubic 1 1 1) 1)
;;; Exercise 1.40 ends here
