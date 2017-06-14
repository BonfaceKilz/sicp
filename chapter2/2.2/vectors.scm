;; vectors
;; helper methods
(define (make-vector x y)
  (cons x y))

(define (xcor v)
  (car v))

(define (ycor v)
  (cdr v))

(define v (make-vector 5 10))
(xcor v)
(ycor v)

(define (make-seg u v)
  (cons u v))

(define (seg-start s)
  (car s))

(define (seg-end s)
  (cdr s))

(define s (make-seg (make-vector 5 10)
                    (make-vector 10 20)))

(seg-start s)
(seg-end s)

(define (midpoint s)
  (let ((a (seg-start s))
        (b (seg-end s)))
    (make-vector
     (average (xcor a) (xcor b))
     (average (ycor a) (ycor b)))))

(define (average x y)
  (/ (+ x y) 2))

(midpoint s)

(define (length s)
  (let
      ((dx (- (xcor (seg-start s)) (xcor (seg-end s))))
       (dy (- (ycor (seg-start s)) (ycor (seg-end s)))))
    (sqrt (+ (square dx)
             (square dy)))))

(length (make-seg
         (make-vector 2 2)
         (make-vector 5 6)))

(let ((x 2)) x)

(let ((x 3) (y 4)) (sqrt (+ (square x) (square y))))
