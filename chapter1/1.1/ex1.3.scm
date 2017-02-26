;; Exercise 1.3
(define
  (square x)
  (* x x)
  )

(define
  (sum-of-squares x y)
  (+ (square x) (square y))
  )


(define
  (largest-two-squares x y z)
  (if (>= x y)
      (sum-of-squares x (if (>= y z) y z))
      (sum-of-squares y (if (>= x z) x z))
      )
  )
