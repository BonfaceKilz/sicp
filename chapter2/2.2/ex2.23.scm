;; Exercise 2.23

(define nil (list))

(for-each
 (lambda(x) (newline) (display x))
 (list 57 321 88))

(newline)

;; An alternative implementation of for-each
(define (for-each-alt proc args)
  (define (iter a count)
    (proc count)
    (if (null? a)
        nil
        (iter (cdr a) (car a))))
  (iter (cdr args) (car args)))

(for-each-alt
 (lambda(x) (newline) (display x))
 (list 57 321 88 99 100 111))
