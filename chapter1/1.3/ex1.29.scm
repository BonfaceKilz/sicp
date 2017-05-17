;; Exercise 1.29
;; Using Simpson's Rule to compute integrals

(define (cube x) (* x x x))

(define (inc n) (+ n 1))

(define (odd? n)
  (> (remainder n 2) 0))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (yk k)(f (+ a (* h k))))
  (define (simpson-term k)
    (* (cond ((or (= k 0) (= k n)) 1)
             ((odd? k) 4)
             (else 2))
       (yk k)))
  (* (/ h 3.0)
     (sum simpson-term 0 inc n)))

;; Tests
(simpson cube 0 1 100)
(simpson cube 0 1 1000)
