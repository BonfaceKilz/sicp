;;; (Exercise 1.46) --- Iterative improvement

;; Iterative improvement: To compute something, we start with an initial guess
;; for the answer, test if the answer is good enough, and otherwise improve the
;; guess and continue the process using the improved guess as the new guess

;;; Code:
(define (good-enough? v1 v2)
  (let ((tolerance 1.e-6))
    (< (/ (abs (- v1 v2)) v2) tolerance)))


(define (iterative-improve good-enough? improve-guess)
  (lambda(x)
    (let((guess (improve-guess x)))
     (if (good-enough? x guess)
        guess
        ((iterative-improve good-enough? improve-guess) guess))
    )))

(define (sqrt x)
  ((iterative-improve
    good-enough?
    (lambda(y)
      (/ (+ (/ x y) y) 2))) 1.0))

(define (fixed-point f first-guess)
  ((iterative-improve f good-enough?)
   first-guess))
;;; Exercise 1.46 ends here
