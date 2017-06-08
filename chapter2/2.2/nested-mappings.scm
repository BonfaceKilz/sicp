;; Nested mappings

(load "../../chapter1/1.2/primality_test.scm")
(load "seq-interfaces.scm")

(define (gen-interval n)
  (accumulate
   append
   nil
   (map (lambda (i)
          (map (lambda (j)
                 (list i j))
               (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n))
   ))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair)
        (cadr pair)
        (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter
        prime-sum?
        (flatmap
         (lambda (i)
           (map (lambda (j)
                  (list i j))
                (enumerate-interval
                 1
                 (- i 1))))
         (enumerate-interval 1 n)))))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (p)
                        (cons x p))
                      (permutations
                       (remove x s))))
               s)))
