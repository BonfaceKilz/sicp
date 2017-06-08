;; Exercise 2.39

(load "ex2.38.scm")

(define (reverse sequence)
  (fold-right
   (lambda (x y) (append y (list x)) )
   nil
   sequence))

(define (reverse-alt sequence)
  (fold-left
   (lambda (x y) (append (list y) x))
   nil
   sequence))
