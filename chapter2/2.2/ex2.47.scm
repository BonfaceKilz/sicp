;; Exercise 2.47

(load "ex2.46.scm")

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin frame)
  (car frame))

(define (edge1 frame)
  (cadr frame))

(define (edge2 frame)
  (cadr (cdr frame)))

;; Alternate way
(define (make-frame-alt origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-alt frame)
  (car frame))
(define (edge1-alt frame)
  (cadr frame))
(define (edge2-alt frame)
  (cddr frame))
