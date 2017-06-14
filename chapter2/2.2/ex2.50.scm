;; Exercise 2.50
;; Defining flip-horiz, which flips painters horizontally,
;; and transformations that rotate painters counterclockwise
;; by 180 degrees and 270 degrees

;;tl(1,0)  tr(1,1)
;; ---------
;; |       |
;; |       |
;; ---------
;;bl(0,0)  br(0,1)

(define bl (make-vect 0 0))
(define br (make-vect 0 1))
(define tr (make-vect 1 1))
(define tl (make-vect 1 0))
(define bl-h-tl (make-vect 0.5 0))
(define bl-h-br (make-vect 0 0.5))
(define tr-h-tl (make-vect 1 0.5))
(define tr-h-br (make-vect 0.5 1))


(define (rotate180-cc painter)
  (transform-painter painter
                     tr
                     tl
                     br))

(define (rotate270-cc painter)
  (transform-painter painter
                     br
                     bl
                     tr))

(define (flip-horiz painter)
  (transform-painter painter
                     tl
                     tr
                     bl))
