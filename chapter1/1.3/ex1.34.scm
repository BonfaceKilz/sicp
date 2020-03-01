;;; (Exercise 1.34) --- Using lambda

;; Comments:
;; (f square) -> Will be evaluated
;; (f (lambda (z)
;;      (* z (+ z 1)))) -> Will be evaluated
;; (f f) -> will not be evaluated

;;; Code:
(define (f g)
  (g 2))

;; Demo:
(define (square x) (* x x))
(f square)

(f (lambda (z)
     (* z (+ z 1))))
;;; Exercise 1.34 ends here
