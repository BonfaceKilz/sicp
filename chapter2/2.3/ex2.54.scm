;; Exercise 2.54
;; 2 lists are said to be equal? if they contain
;; equal elements arranges in the same order.

(define (equal? first second)
  (cond ((and (null? first) (null? second)) true)
        ;; if any of this is false, false
        ((and (not (and (symbol? (car first))
                        (symbol? (car second))
                        (eq? (car first) (car second))))
              (not (and (list? (car first))
                        (list? (car second))
                        (equal? (car first) (car second)))))
         false)
        (else (equal? (cdr first) (cdr second)))))

(newline)
(display (equal? '(this is a list)
                '(this is a list)))

(newline)
(display (equal? '(this is a list)
                 '(this (is a) list)))
