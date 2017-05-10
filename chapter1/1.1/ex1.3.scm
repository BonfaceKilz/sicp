;; Exercise 1.3
;; Program that takes 3 numbers as arguments and returns the
;; sum of the squares of the two larger numbers

(define (square x)
  (* x x))

(define (sum func x y z)
  (if (>= x y)
      (+ (func x)
         (if (>= y z) (func y) (func z)))
      (+ (func y)
         (if (>= x z) (func x) (func z)))))

(sum square 4 3 2)
