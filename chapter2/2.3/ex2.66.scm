;; Exercise 2.66
;; Implementing the look up procedure for the case
;; where the set of records is structured as a
;; binary tree, ordered by the numerical values of
;; the key.
(load "./sets-as-binary-trees.scm")

(define (binary-lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((equals? given-key
            (key (entry set-of-records)))
         (entry set-of-records))
        (else
         (binary-lookup given-key
                        (right-branch set-of-records)))))
