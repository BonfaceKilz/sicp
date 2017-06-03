;; Exercise 2.22

(load "mapping-lists.scm")

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

;; demo
;; The cons operator operates like a stack.
;; The first element of the list to be operated on
;; is placed at the bottom of the stack
;; (square-list (list 4 7 8 9))
;; (iter (4 7 8 9) nil)
;; (iter (7 8 9) (cons (square 4) nil))
;; (iter (7 8 9) (16 nil))
;; (iter (8 9) (cons (square 7) (16 nil)))
;; (iter (8 9) (49 16 nil))
;; (iter (9) (cons (square 8) (49 16 nil)))
;; (iter (9) (64 49 16 nil))
;; (iter (nil) (cons (square 9) (64 49 16 nil)))
;; (iter (nil) (81 64 49 16 nil))
;; (81 64 49 16 nil)

(define (square-list-fix items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square
                     (car things))))))
  (iter items nil))
