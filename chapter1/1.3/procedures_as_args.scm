(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

;; (sum-integers 3 9)
;; (+ 3 (sum-integers 4 9))
;; (+ 3 (+ 4 (sum-integers 5 9)))
;; (+ 3 (+ 4 (+ 5 (sum-integers 5 9))))
;; (+ 3 (+ 4 (+ 5 (+ 6 (sum-integers 6 9)))))
;; (+ 3 (+ 4 (+ 5 (+ 6 (+ 7 (sum-integers 7 9))))))
;; (+ 3 (+ 4 (+ 5 (+ 6 (+ 7 (+ 8 (sum-integers 9 9)))))))
;; (+ 3 (+ 4 (+ 5 (+ 6 (+ 7 (+ 8 0))))))
;; (+ 3 (+ 4 (+ 5 (+ 5 (+ 7 8)))))
;; (+ 3 (+ 4 (+ 5 (+ 5 15))))
;; (+ 3 (+ 4 (+ 5 20)))
;; (+ 3 (+ 4 25))
;; (+ 3 29)
;; 32

(define (cube x) (* x x x))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a (sum-cubes (+ a 1) b)))))

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

;; An alternate way to define sum cubes
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (sum-cubes-alt a b)
  (sum cube a inc b))

;; An alternative way add integers
(define (identity x) x)
(define (sum-integers-alt a b)
  (sum identity a inc b))


;; An alternative way for pi-sum
(define (pi-sum-alt a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

;; Calculating the integral
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

;; Using lambda notation
(define (pi-sum-l a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x x2))))
       a
       (lambda (x) (+ x 4))
       b))

(define (integral f a b dx)
  (* (sum f
          (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b)
     dx))
