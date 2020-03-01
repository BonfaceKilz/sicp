;;; (Exercise 1.44) --- nth-fold smoothed function

;; Computing a smoothing function. if f is a function whose value at a point x
;; is the average of f(x-dx), f(x), f(x+dx)

;;; Code:
(define (smooth f)
  (let ((dx 0.000001))
    (lambda(x)(/ (+ (f (+ x dx))
                    (f (- x dx))
                    (f dx))))))

(define (n-fold-smooth f n)
  "smooth a smoothed function n times"
  (define (repeated f n)
    (define (compose f g)
      (lambda(x)
        (f (g x))))

    (if (= n 1)
        f
        (compose f (repeated  f (- n 1)))))

  ((repeated smooth n) f))
;;; Exercise 1.44 ends here
