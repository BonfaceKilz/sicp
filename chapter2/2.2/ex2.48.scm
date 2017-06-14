;; Exercise 2.48

(load "painter.scm")

;; Start-segment:
;; vector running from origin to segment start
;; End-segment:
;; vector running from origin to segment end
(define (make-segment start-segment end-segment)
  (cons start-segment end-segment))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))
