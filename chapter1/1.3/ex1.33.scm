;; Exercise 1.33

(load "ex1.32.scm")

;; Recursive form of filtered version
(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value term (next a) next b filter))
          (combiner null-value (filtered-accumulate combiner null-value term (next a) next b filter)))))

;; Another form
(define (filtered-accumulator filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (if (filter a) (term a)
                    null-value)
                (filtered-accumulator filter combiner null-value term (next a) next b))))

;; An iterative version
(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) (combiner result (term a))))
          (else (iter (next a) result))))
  (iter a null-value))

(define (define (next next x) (+ x 1)))

(define (sum-prime-squares a b))
