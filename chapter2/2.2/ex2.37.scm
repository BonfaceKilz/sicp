;; Exercise 2.37
;; Defining matrix operations

(load "ex2.36.scm")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (m-row)(dot-product m-row v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m-row) (matrix-*-vector cols m-row))
         m)))

;; Tests
(define matrix (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12)))
;; dot-product
(newline)
(display "Dot product:")
(display(dot-product (list 1 2 3) (list 4 5 6)))
(newline)
;; matrix-*-vector
(display "matrix-*-vector: ")
(display (matrix-*-vector matrix (list 2 3 4 5)))
(newline)
;; transpose
(display "transpose: ")
(display (transpose matrix))
(newline)
;; matrix-*-matrix
(display "matrix-*-matrix: ")
(display (matrix-*-matrix matrix
                          (list (list 1 2) (list 1 2) (list 1 2) (list 1 2))))
