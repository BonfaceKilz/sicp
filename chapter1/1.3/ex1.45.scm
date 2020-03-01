;;; (Exercise 1.45) --- average damps required to compute nth roots as a fixed
;;; point search based upon repeated average damping

;; Experiment to determine how many average damps are required to compute n-th
;; roots as a fixed point search based upon repeated average damping.

;;; Code:
(define (average x y)
  (/ (+ x y) 2.0))

(define (average-damp f)
  (lambda(x) (average x (f x))))

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

(define (repeated f n)
  (define (compose f g)
    (lambda(x)
      (f (g x))))

  (if (= n 1)
      f
      (compose f (repeated  f (- n 1)))))

(define (get-max-pow n)
  (define (iter p r)
    (if (< (- n r) 0)
        (- p 1)
        (iter (+ p 1) (* r 2))))
  (iter 1 2))

(define (nth-root n x)
  (fixed-point ((repeated average-damp (get-max-pow n))
                (lambda(y)(/ x (expt y (- n 1)))))
               1.0))

;; Alternative solution
(define (log2 x)
  (/ (log x) (log 2)))

(define (nth-root/alt n x)
  (fixed-point ((repeated average-damp (floor (log2 n)))
                (lambda(y) (/ x (expt y (- n 1)))))
               1.0))
;;; Exercise 1.45 ends here
