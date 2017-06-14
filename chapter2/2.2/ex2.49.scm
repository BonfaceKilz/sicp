;; Exercise 2.49
;;
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
(define (outline-painter)
  (define (outline-seg-list)
    (list
     (make-segment bl tl)
     (make-segment tl tr)
     (make-segment tr br)
     (make-segment br bl)))
  (segments->painter outline-segment-list))

(define (x-painter)
  (define (x-seg-list)
    (list
     (make-segment bl tr)
     (make-segment br tl)))
  (segments->painter x-seg-list))

(define (diamond-painter)
  (define (diamond-seg-list)
    (list
     (make-segment bl-h-tl tr-h-tl)
     (make-segment tr-h-tl tr-h-br)
     (make-segment tr-h-br bl-h-br)
     (make-segment bl-h-br bl-h-tl)))
  (segments->painter diamond-seg-list))

;; Todo:
;; define wave painter
