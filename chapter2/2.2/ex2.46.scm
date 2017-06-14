;; Exercise 2.46
;; Vector operations

(define (make-sth x y)
  (cons x y))
(define (make-vect xcor-vect ycor-vect)
  (cons xcor-vect ycor-vect))

(define (xcor-vect vector)
  (car vector))

(define (ycor-vect vector)
  (cdr vector))

(define (vector-op op vector1 vector2)
  (make-vect (op (xcor-vect vector1)
                 (xcor-vect vector2))
             (op (ycor-vect vector1)
                 (ycor-vect vector2))))

(define (add-vect vector1 vector2)
  (vector-op + vector1 vector2))

(define (sub-vect vector1 vector2)
  (vector-op - vector1 vector2))

(define (scale-vect s vect)
  (vector-op * vect (make-vect s s)))
