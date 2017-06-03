;; Count-leaves

(load "lists.scm")

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))


(define x (cons (list 1 2) (list 3 4)))

(display "x: ")
(display x)
(newline)

(display "(length x): ")
(display (length x))
(newline)

(newline)
(display "(count-leaves x): ")
(display (count-leaves x))
(newline)

(display "(list x x): ")
(display (list x x))
(newline)

(display "(length (list x x)): ")
(display (length (list x x)))
(newline)

(display "(count-leaves (list x x)): ")
(display (count-leaves (list x x)))
