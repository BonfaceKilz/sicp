;; Exercise 2.33
;; Some basic list-manipulation operations as
;; accumulations

(load "seq-interfaces.scm")

(define (map p sequence)
  (accumulate
   (lambda (x y) (cons (p x) y))
   nil
   sequence))

;; test1
(newline)
(display (map square (list 1 2 3 4)))
(newline)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

;;test2
(newline)
(display (append (list 1 3 4) (list 5 7 8)))
(newline)

(define (length sequence)
  (accumulate
   (lambda(x y)(+ y() 1))
   0
   sequence))

;; test3
(display (length (list 1 3 4)))
