;; Exercise 3.17

;; Devise a correct version of the count-pairs procedure of Exercise
;; 3.16 that returns the number of distinct pairs in any
;; structure. (Hint: Traverse the structure, maintaining an auxiliary
;; data structure that is used to keep track of which pairs have
;; already been counted.)

(define (count-pairs x)
  (let ((visited '()))
    (define (count x)
      (cond ((not (pair? x))
             0)
            ((memq x visited)
             0)
            (else
             (set! visited (cons x visited))
             (+ (count (car x))
                (count (cdr x))
                1))))
    (count x)))

;; unit tests
(define first (cons 1 2))
(define second (cons 3 4))
(define third (cons first second))
(set-car! second first)
(count-pairs third) ;; 3

(define first (cons 1 2))
(define second (cons first first))
(define third (cons second second))
(count-pairs third)
