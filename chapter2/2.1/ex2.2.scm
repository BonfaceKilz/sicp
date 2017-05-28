;; Exercise 2.2
;; Representing line-segments in a plane

(define (make-segment  p1 p2) (cons p1 p2))
(define (start-segment plane) (car plane))
(define (end-segment plane) (cdr plane))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (midpoint-segment line)
  (average-point (start-segment line)
                 (end-segment line)))

(define (average-point p1 p2)
  (define (average x y)
    (/ (+ x y) 2))
  (make-point (average (x-point p1) (x-point p2))
              (average (y-point p1) (y-point p2))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; Tests
(define point1 (make-point 20.0 30.0))
(define point2 (make-point 32.0 44.0))
(define line1 (make-segment point1 point2))
(print-point (midpoint-segment line1))
