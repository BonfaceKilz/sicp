;; Exercise 2.45

(define (split split-pos identify-pos)
  (lambda (painter n)
    (let ((smaller (split painter
                          (- n 1))))
      (identify-pos painter (split-pos smaller smaller)))))

(define right-split (split beside below))
(define up-split (split below beside))
