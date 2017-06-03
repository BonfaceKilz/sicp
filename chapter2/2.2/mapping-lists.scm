;; Mapping over lists

(define nil (list))

(define (scale-list-old items factor)
  (if (null? items)
      nil
      (cons (* (car items) factor)
            (scale-list-old (cdr items)
                        factor))))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (abs n)
  (if (< n 0) (- n) (+ n)))

;; tests
(display (map abs (list -10 2.5 -11.6 17)))
(newline)
(display (map (lambda (x) (* x x)) (list 1 2 3 4)))
(newline)


(define (scale-list items factor)
  (map (lambda(x) (* x factor))
       items))
