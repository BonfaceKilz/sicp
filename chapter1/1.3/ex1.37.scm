 ;; Exercise 1.37
;; Infinite continued fraction


;; Recursive process
(define (cont-frac n d k)
  (define (recurse i)
    (/ (n i)
       (+ (d i)
          (if (= i k)
              0
              (recurse (+ i 1))))))
  (recurse 0))

;; Testing recursive fn
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)

;; Iterative process
(define (cont-frac-alt n d k)
  (define (iter i result)
    (if (= i 1)
        (/ (n i) (+ (d i) result))
        (iter (- i 1) (/ (n i)
                         (+ (d i) result)))))
  (iter k 1))

(cont-frac-alt (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)
