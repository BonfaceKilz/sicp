;; Exercise 2.29
;; A binary mobile

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (left-branch mobile)
  (car mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (cond ((not (pair? mobile)) 0)
        ((not (pair? (branch-structure mobile))) (branch-structure mobile))
        (else (+ (total-weight (left-branch mobile))
                 (total-weight (right-branch mobile))))))

;; Tests
(define level-1-mobile (make-mobile (make-branch 2 1)
                                    (make-branch 1 2)))

(define level-2-mobile (make-mobile (make-branch 3 level-1-mobile)
                                    (make-branch 9 1)))

(define level-3-mobile (make-mobile (make-branch 4 level-2-mobile)
                                    (make-branch 8 2)))

(newline)
(display (total-weight level-1-mobile))
(newline)
(display (total-weight level-2-mobile))
(newline)
(display (total-weight level-3-mobile))
(newline)

;; Torque = length * weight
(define (structure-is-mobile? structure)
  (pair? structure))

(define (branch-balanced? branch)
  (let ((s (branch-structure branch)))
    (if (structure-is-mobile? s)
        (balanced? s)
        true)))

(define (branch-torque branch)
  (* (branch-weight branch)
     (branch-length branch)))

(define (balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (= (branch-torque left)
            (branch-torque right))
         (branch-balanced? left)
         (branch-balanced? right))))


;; Changing representation forces change to any accessors
;; with knowledge of structures

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

(define (structure-is-mobile? structure)
  (pair? structure))
