;; Exercise 1.34

(define (f g) (g 2))

;; test
(define (square x) (* x x))

(f square)

(f (lambda (z) (* z (+ z 1))))

;; Comments
;; (f f) -> will not compile
;; lambda function can be use to describe an "anonymous" inner function
