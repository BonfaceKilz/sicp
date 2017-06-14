;; Exercise 2.44
;; Defining up-split used by corner-split.
;; Similar to right-split, except that it switches
;; roles of below and beside.

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter
                               (- n 1))))
        (below painter
               (beside smaller smaller)))))
