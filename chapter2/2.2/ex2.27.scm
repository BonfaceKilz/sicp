;; Exercise 2.27

(load "ex2.18.scm")

(define nil (list))

(define (deep-reverse lst)
  (cond ((null? lst) nil)
        ((not (pair? lst)) lst)
        (else (append (deep-reverse (cdr lst))
                      (list (deep-reverse (car lst)))))))

(define x
  (list (list 1 2) (list 3 4)))

(newline)
(display (reverse x))
(newline)

(deep-reverse x)
