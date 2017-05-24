;; Exercise 1.44
;; Computing a smoothing function.
;; if f is a function whose value at a point x is
;; the average of f(x-dx), f(x), f(x+dx)

(define (smooth f)
  (define dx 0.000001)
  (lambda(x)(/ (+ (f (+ x dx))
                  (f (- x dx))
                  (f dx)))))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))
