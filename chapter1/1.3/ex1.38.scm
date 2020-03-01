;;; (Exercise 1.38) --- De Fractionibus Continuis

;; In 1737, the Swiss mathematician Leonhard Euler published a memoir "De
;; Fractionibus Continuis", which included a continued fraction for e - 2, where
;; e is the base of the natural logarithms. In this fraction, Ni are all 1, and
;; the Di are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ...; This program
;; approximates e, based on Euler's expansion

(define (continued-fraction n d k)
  "Calculating continued fractions using an iterative process"
  (define (iter i result)
    (if (= i 1)
        (/ (n i) (+ (d i) result))
        (iter (- i 1) (/ (n i)
                         (+ (d i) result)))))
  (iter k 1))

(define (euler k)
  "Estimating the value of e"
  (+ 2.0 (continued-fraction
          (lambda (i) 1.0)
          (lambda (i) (if (= (remainder (+ i 1) 3) 0)
                          (/ (+ k 1) 1.5)
                          1))
          k)))
;;; Exercise 1.38 ends here
