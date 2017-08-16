;; Exercise 3.9
;; In 1.2.1 we used the substitution model to analyze two
;; procedures for computing factorials, a recursive version

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

;; and an iterative version
(define (factorial n)
  (fact-iter 1 1 n))
(define (fact-iter product
                   counter
                   max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

;; Show that the environment structures created by evaluating
;; (factorial 6) using each.v.rsion of the factorial procedure
