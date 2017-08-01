;; Exercise 2.75
;; Implementing the constructor make-from-mag-ang
;; in message-passing style

;; 'magnitude
;; 'imag-part
(define (make-from-mag-ang r a)
  (define dispatch op)
  (cond ((eq? op 'magnitude) r)
        ((eq? op 'angle) a)
        ((eq? op 'real-part)
         (* r (cos a)))
        ((eq? op 'imag-part)
         (* r (sin a)))
        (else
         (error "Unknown op: MAKE-FROM-MAG-ANG"))))
