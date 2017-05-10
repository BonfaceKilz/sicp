;; Exercise 1.5
;; Observing the interpreter behaviour when performing a
;; function

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; Applicative: A final value is not achieved since the arguments are
;; evaluated first.
;; (test 0 (p))
;; (test 0 p)
;; (test 0 p)
;; ... goes on
