;; Exercise 3.16

;; Ben Bitdiddle decides to write a procedure to count the number of
;; pairs in any list structure. "It's easy," he reasons. "The number
;; of pairs in any structure is the number in the car plus the number
;; in the cdr plus one more to count the current pair." So Ben writes
;; the following procedure:

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

;; unit tests
(define test1 (list 'a 'b 'c 'd))
(count-pairs test1) ;; 4
(define test2 (list 'a 'b 'c))
(count-pairs test2) ;; 3
(define x (cons 'a 'b))
(define y (cons 'a 'b))
(define test3 (cons x y))
(set-car! x y)
(count-pairs test3) ;; 4
(define x (cons 1 2))
(define y (cons x x))
(define test4 (cons y y))
(count-pairs test4) ;; 7
