;;Exercise 3.18:

;; Write a procedure that examines a list and determines whether it
;; contains a cycle, that is, whether a program that tried to find the
;; end of the list by taking successive cdrs would go into an infinite
;; loop. Exercise 3.13 constructed such lists.

(define (cycle? x)
  (let ((visited '()))
    (define (cycle-helper x)
      (cond ((not (pair? x))
             #f)
            ((memq x visited)
             #t)
            (else
             (set! visited (cons x visited))
             (or (cycle-helper (car x))
                 (cycle-helper (cdr x))))))
    (cycle-helper x)))
