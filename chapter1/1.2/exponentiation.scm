;; Exponentiation

;; Using a linear recursive process
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b(- n 1)))
      )
  )

;; 3 ^ 4
;;(expt 3 4)
;;(* 3 (expt 3 3))
;;(* 3 (* 3 (expt 3 2)))
;;(* 3 (* 3 (* 3 (expt 3 1))))
;;(* 3 (* 3 (* 3 (* 3 (expt 3 0)))))
;;(* 3 (* 3 (* 3 (* 3 1))))
;;(* 3 (* 3 (* 3 3)))
;;(* 3 (* 3 9))
;;(* 3 27)
;;81

;; Using fast exponiantion
(define (fast-expt b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-expt b (/n 2))))
	(else (* b (fast-expt b (- n 1))))))
(define (even? n)
  (= (remainder n 2) 0))
(define (square x)
  (* x x))

;; 3 ^ 4
;; (fast-exp 3 4)
;; (square (fast-exp 3 2))
;; (square (square (fast-exp 3 1)))
;; (square (square (* 3 (fast-exp 3 0))))
;; (square (square (* 3 1)))
;; (square (square 3))
;; (square 9)
;; 81


;; Using a linear iterative process
(define (exptnew b n)
  (expt-iter b n 1)
  )

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
		 (-counter 1)
		 (* b product)
		 )))
;; 3 ^ 4
;;(exptnew 3 4)
;;(expt-iter 3 4 1)
;;(expt-iter 3 3 3)
;;(expt-iter 3 2 9)
;;(expt-iter 3 1 27)
;;(expt-iter 3 0 81)
;;81
