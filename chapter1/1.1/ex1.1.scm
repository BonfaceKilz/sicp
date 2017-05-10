;; Exercise 1.1
;; Evaluating a sequence of expressions

10
;; prints 10

(+ 5 3 4)
;; prints 12

(- 9 1)
;; prints 8

(/ 6 2)
;; prints 3

(+ (* 2 4) (- 4 6))
;;prints 10

(define a 3)
;;a = 3

(define b (+ a 1))
;;b = 4

(+ a b (* a b))
;;prints 19

(= a b)
;;prints #f [false]

(if (and (> b a) (< b (* a b)))
    b
    a)
;;prints 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
;;prints 16

(+ 2 (if (> b a) b a ))
;;prints 6

(* (cond ((> a b) a)
	 ((< a b) b)
	 (else -1))
   (+ a 1))
;;prints 16


