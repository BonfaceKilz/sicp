;;; (Exercise 1.36) --- Finding solution of x^x = 1000 used fixed-point

;; Modifying fixed-point so that it prints the sequence of approximations it
;; generates using the newline and display primitives

;;; Code:
(define (fixed-point f first-guess)
  "Calculating fixed points, and displaying the guesses"
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

(define (fixed-point->log n)
  "Fixed point of a log function. Takes 34 steps"
  (fixed-point
   (lambda (x) (/ (log n) (log x)))
   4.0684))

(define (fixed-point->damped-log n)
  "Fixed point of a log function with damping. Takes 11 steps"
  (define (average a b)
    (/ (+ a b) 2.0))
  (fixed-point
   (lambda(x) (average x (/ (log n) (log x))))
   10.0))
;;; Exercise 1.36 ends here
