;; Exercise 1.4
;; Evaluating model of evaluation

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; example: evaluate (a-plus-abs 10 20)
;; (a-plus-abs 10 20)
;; ((if (> 20 0) + -) 10 20)
;; (+ 10 20)
;; 30
