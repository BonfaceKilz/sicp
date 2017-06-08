;; Exercise 2.36
;; accumulate-n:
;; it's third argument can take a sequence of
;; sequences, which are all assumed to have the
;; same number of elements. It applies the
;; designated accumulation procedure to combine
;; all the first elements of the sequences, all
;; the second elements of the sequences, and so
;; on, and returns a sequence of the results.

(load "seq-interfaces.scm")

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

;; test
(newline)
(accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
