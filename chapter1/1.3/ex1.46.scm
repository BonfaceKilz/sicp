;; Exercise 1.46

;; Iterative improvement:
;; To compute something, we start with an initial guess
;; for the answer, test if the answer is good enough, and
;; otherwise improve the guess and continue the process
;; using the improved guess as the new guess

;; Tests
(define (good-enough? v1 v2)
  (define (abs x)
    (if (< x 0) (- x) x))
  (define tolerance 1.e-6)
  (< (/ (abs (- v1 v2)) v2) tolerance))


(define (iterative-improve good-enough? improve-guess)
  (lambda(x)
    (let((xim (improve-guess x)))
     (if (good-enough? x xim)
        xim
        ((iterative-improve good-enough? improve-guess) xim))
    )))

(define (sqrt x)
  ((iterative-improve
    good-enough?
    (lambda(y)
      (/ (+ (/ x y) y) 2))) 1.0))

(define (fixed-point f first-guess)
  ((iterative-improve
    f
    good-enough?) first-guess))
