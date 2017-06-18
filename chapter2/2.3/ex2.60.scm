;; Exercise 2.60
;; Designing procedures that operate sets with
;; duplicates

(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (append set1 set2))

;; element-of-set? remains the same
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))
-
(define (intersection-set-strict set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set-strict (cdr set1) set2)))
        (else (intersection-set-strict (cdr set1) set2))))

(define (intersection-set set1 set2)
  (let ((inter (intersection-set-strict set1 set2))
        (union (union-set set1 set2)))
    (filter (lambda (x) (element-of-set? x inter))
            union)))
