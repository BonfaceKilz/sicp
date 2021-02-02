;;; (Exercise 1.37) --- Infinite continued fraction

;; The infinite continued fraction expansion with the Ni and the Di all equal to
;; 1 produces 1/𝛟 where 𝛟 is the golden ration

;;; Code:
(define (continued-fraction n d k)
  "Calculating continued fractions using a recursive process"
  (define (recurse i)
    (/ (n i)
       (+ (d i)
          (if (= i k)
              (/ (n k) (d k))
              (recurse (+ i 1))))))
  (recurse 0))

(define (continued-fraction-iter n d k)
  "Calculating continued fractions using an iterative process"
  (define (iter i result)
    (if (= i 1)
        (/ (n i) (+ (d i) result))
        (iter (- i 1) (/ (n i)
                         (+ (d i) result)))))
  (iter k 1))

;; Demos:

(continued-fraction (lambda (i) 1.0)
                    (lambda (i) 1.0)
                    100)

(continued-fraction-iter (lambda (i) 1.0)
                         (lambda (i) 1.0)
                         100)
;;; Exercise 1.37 ends here
