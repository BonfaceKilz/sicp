;;; (Exercise 1.39) --- Lambert's Formula

;; Continued fraction representation of the tangential function

;;; Code:
(define (continued-fraction n d k)
  "Calculating continued fractions using an iterative process"
  (define (iter i result)
    (if (= i 1)
        (/ (n i) (+ (d i) result))
        (iter (- i 1) (/ (n i)
                         (+ (d i) result)))))
  (iter k 1))

(define (tan-cf x k)
  "Compute an approximation of the tangent function based on Lambert's formula"
  (continued-fraction (lambda (i)
                        (if (= i 1)
                            x
                            (- (* x x))))
                      (lambda(i)
                        (- (* i 2) 1))
                      k))
;;; Exercise 1.39 ends here
