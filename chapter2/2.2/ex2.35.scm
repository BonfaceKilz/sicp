;; Exercise 2.35
;; Redefining the count-leaves function

(define (count-leaves t)
  (accumulate
   ;; operation
   +
   ;; initial condition
   0
   ;; sequence
   (map
    (lambda (t)
      (cond ((null? t) 0)
            ((pair? t) (count-leaves t))
            (else 1)))
    t)))
