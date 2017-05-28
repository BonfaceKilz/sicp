;; Exercise 2.3
;; Implementing a representation for rectangles in a
;; plane

(load "ex2.2.scm")

(define (make-rect line1 line2)
  (cons line1 line2))

(define (top-left r)
  (car (car r)))

(define (top-right r)
  (cdr (car r)))

(define (bottom-left r)
  (car (cdr r)))

(define (bottom-right r)
  (cdr (cdr r)))

(define (rect-area r)
  (*
   (- (x-point (top-right r)) (x-point (top-left r)))
   (- (y-point (top-right r)) (y-point (bottom-right r)))))

(define (rect-perim r)
  (* 2
     (+
      (- (x-point (top-right r)) (x-point (top-left r)))
      (- (y-point (top-right r)) (y-point (bottom-right r))))))

;; Tests
(define my-rect
  (make-rect
   (make-segment
    (make-point 0 9)
    (make-point 9 9))
   (make-segment
    (make-point 0 0)
    (make-point 9 0))))

(display (rect-area my-rect))
(newline)
(display (rect-perim my-rect))
(newline)

;; Using abstraction barriers
(define (rect-width r)
  (-
   (x-point (top-right r))
   (x-point (top-left r))))

(define (rect-height r)
  (-
   (y-point (top-right r))
   (y-point (bottom-right r))))

(define (rect-area-alt r)
  (*
   (rect-width r)
   (rect-height r)))

(define (rect-perim-alt r)
  (* 2
     (+
      (rect-width r)
      (rect-height r))))

(display (rect-area-alt my-rect))
(newline)
(display (rect-perim-alt my-rect))
(newline)

Isolation layers look like this:

;; Area/Perim
;; --------------------------------------------------
;; Side widths/ points selectors and constructor
;; --------------------------------------------------
;; Segment constructors and selectors
;; --------------------------------------------------
;; Points constructors and selectoros
;; --------------------------------------------------
;; Pairs
