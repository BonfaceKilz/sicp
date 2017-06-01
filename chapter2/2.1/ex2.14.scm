;; Exercise 2.14
;; Demonstrating that par1 and par2 give different answers

(load "ex2.12.scm")
(define (par1 r1 r2)
  (div-interval
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one
     (add-interval
      (div-interval one r1)
      (div-interval one r2)))))

;; Demo
(define r1 (cons 2 8))
(define r2 (cons 2 8))
(display (par1 r1 r2))
(newline)
(display (par2 r1 r2))
