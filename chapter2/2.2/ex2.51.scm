;; Exercise 2.51

(load "ex2.50.scm")

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 1.0 0.0)))
          (paint-top
           (transform-painter painter2
                              split-point
                              (make-vect 0.0 1.0)
                              (make-vect 0.5 1.0)))))
    (lambda (frame)
      (paint-bottom frame)
      (paint-top frame))))

(define (below-alt painter1 painter2)
  (rotate270-cc
   (rotate180-cc
    (beside (rotate270-cc painter1)
            (rotate270-cc painter2)))))
