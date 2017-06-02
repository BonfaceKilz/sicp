(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items)
                (- n 1))))

(define (length items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a)
                     (+ 1 count))))
  (length-iter items 0))

;; recursive form of length
(define (length-recursive items)
  (if (null? items)
      0
      (+ 1 (length-recursive (cdr items)))))

;; testing length
(define odds
  (list 1 3 5 7))
(length odds)
