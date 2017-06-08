;; Exercise 2.38

(load "seq-interfaces.scm")

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define fold-right accumulate)

;; What are the results of:
(display (fold-right / 1 (list 1 2 3)))
;; Result: 3/2
(newline)
(display (fold-left  / 1 (list 1 2 3)))
;; Result: 1/6
(newline)
(display (fold-right list nil (list 1 2 3)))
;; Result: (1 (2 (3 ())))
(newline)
(display (fold-left list nil (list 1 2 3)))
;; Result: (((() 1) 2) 3)

;; Comments:
;; op has to associative for fold-left and fold-right
;; to be equivalent
