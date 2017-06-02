;; Exercise 2.20
;; Using the dotted tail notation
;; to write a parity procedure
(load "lists.scm")

(define (odd? n) (not (= (remainder n 2) 0)))

(define (same-parity leader . rest)
  (define (same-parity-iter items result)
    (cond ((null? items) result)
          ((eq? (odd? leader)
                (odd? (car items)))
           (same-parity-iter (cdr items) (append result (list (car items)))))
          (else (same-parity-iter (cdr items) result))))
  (same-parity-iter rest (list leader)))

;; tests
(display (same-parity 1 2 3 4 5 6 7))
(newline)
(display (same-parity 2 3 4 5 6 7))
