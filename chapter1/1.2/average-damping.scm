(define (average-damp f)
  (define (average a b) (/ (+ a b) 2))
  (lambda (x) (average x (f x))))
(define (square x) (* x x))
;; Example usage:
((average-dump square) 10)
