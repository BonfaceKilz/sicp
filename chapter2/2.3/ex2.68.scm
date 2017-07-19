;; Exercise 2.68

(load "ex2.67.scm")
(define (encode message tree)
  (if (null? message)
      '()
      (append
       (encode-symbol (car message)
                      tree)
       (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-1 symbol tree result)
    (cond ((leaf? tree) result)
          ((element-of-set? symbol (symbols (left-branch tree)))
           (encode-1 symbol (left-branch tree) (append result '(0))))
          (else
           (encode-1 symbol (right-branch tree (append result '(1)))))))

  (define (encode-1-rec symbol tree)
    (cond ((leaf? tree) '())
          ((element-of-set? symbol (symbols (left-branch tree)))
           (cons 0 (encode-1-rec symbol (left-branch tree))))
          (else
           (cons 1 (encode-1-rec symbol (right-branch tree))))))
  (if (not (element-of-set? symbol (symbols tree)))
      (error "bad symbol used" symbol)
      (encode-1-rec symbol tree)))


(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))
