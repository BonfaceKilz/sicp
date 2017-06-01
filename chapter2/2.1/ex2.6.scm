;; Exercise 2.6.scm
;; Church numerals

(define zero (lambda (f)
               (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; (add-1 zero)
;; (add-1 (lambda (f) (lambda (x) x)))
;; ((lambda (f) (lambda (x) (f ((zero f) x)))))
;; ((lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x)))))
;; ((lambda (f) (lambda (x) (f ((lambda (x) x) x)))))
;; (lambda (f) (lambda (x) (f x)))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))
