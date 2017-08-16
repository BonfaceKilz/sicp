;; Exercise 2.78

;; Modify the definitions of type-tag, contents, and attach-tag
;; from 2.4.2 so that our generic system takes advantage of Scheme's
;; internal type system. That is to say, the system should work as
;; before except that ordinary numbers should be represented simply as
;; Scheme numbers rather than as pairs whose car is the symbol
;; scheme-number


;; modified attach-tag
(define (attach-tag type-tag contents)
  (if (number? contents)
      contents
      (cons type-tag contents)))

;; modified type-tag
(define (type-tag datum)
  (cond ((pair? datum) (car datum))
        ((number? datum) 'scheme-number)
        (else
         (error "Badd tagged datum or not a number: TYPE-TAG" datum))))

;; modified contents
(define (contents datum)
  (cond ((pair? datum) (cdr datum))
        ((number? datum) datum)
        (else
         (error "Bad tagged datum or not a number: CONTENTS" datum))))
