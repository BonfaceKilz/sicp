;;; (Exercise 1.30) --- Simpson's Rule

;; Iterative form of the sum function

;;; Code:
(define (simpson f a b n)
  "Numerical integration using Simpson's rule"

  (define (inc n) (+ n 1))

  ;; Sum is generates an iterative process
  (define (sum term a next b)
    (define (iter a result)
      (if (> a b)
          result
          (iter (next a)(+ result (term a)))))
    (iter a 0))

  (define h (/ (- b a) n))

  (define (yk k)(f (+ a (* h k))))

  (define (simpson-term k)
    (* (cond ((or (= k 0) (= k n)) 1)
             ((odd? k) 4)
             (else 2))
       (yk k)))
  (* (/ h 3.0)
     (sum simpson-term 0 inc n)))

;; Test
(define (cube x) (* x x x))
(simpson cube 0 1 100)
(simpson cube 0 1 1000)

;;; Exercise 1.30 ends here
