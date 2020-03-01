;;; (Exercise 1.35) --- Computing 𝟇

;; Showing that the golden ratio: 𝟇(1.2.2) is a fixed point of transformation x
;; -> 1 + 1/x
;; The golden ratio is the constant: 1.6180327868852458

;;; Code:
(define (fixed-point f first-guess)
  "Calculating fixed points"
  (let ((tolerance 0.00001))
    (define (close-enough? v1 v2)
      (< (abs (- v1 v2)) tolerance))
    (define (try guess)
      (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next))))

    (try first-guess)))


(define (golden-ratio x)
  (fixed-point (lambda (x)
                 (+ 1.0 (/ 1.0 x)))
               1))
;;; Exercise 1.35 ends here
