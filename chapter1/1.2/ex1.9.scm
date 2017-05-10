;; Exercise 1.9
;; Using the substition model to analyze a procedure
;; to find out if its iterative or recursive

(define (inc x)
  (+ x 1))

(define (dec y)
  (- y 1))

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))
;; This is a recursive process
;; It calls itself until a certain condition is met
;;
;;(+ 4 5)
;;(inc (+ 3 5))
;;(inc (inc (+ 2 5)))
;;(inc (inc (inc (+ 1 5))))
;;(inc (inc (inc (inc (+ 0 5)))))
;;(inc (inc (inc (inc 5))))
;;(inc (inc (inc 6)))
;;(inc (inc 7))
;;(inc 8)
;;9


(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))
;;This is an iterative process
;;(+ 4 5)
;;(+ 3 6)
;;(+ 2 7)
;;(+ 1 8)
;;(+ 0 9)
;;9
