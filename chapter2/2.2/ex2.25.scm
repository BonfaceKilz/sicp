;; Exercise 2.25
;; Picking a combination of cars and cdrs
;; that will pick 7 from each of the following list

(newline)
(define x (list 1 3 (list 5 7) 9))
(display (car (cdr (car (cdr (cdr x))))))
(newline)

(define y (list (list 7)))
(display (car (car y)))
(newline)

(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(display (cadr (cadr (cadr (cadr (cadr (cadr z)))))))
