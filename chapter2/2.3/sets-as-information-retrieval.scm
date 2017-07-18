;; Lookup implemented for a set of records
;; which are implemented as unordered lists

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((equal? given-key
                 (key (car set-of-records)))
         (car set-of-records))
        (else
         (lookup given-key
                 (cdr set-of-records)))))
