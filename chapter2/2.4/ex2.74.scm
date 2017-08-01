;; Exercise 2.74
(load "tagged-data.scm")

;; Test records
;;(define (make-division-personnel-files . args)
;;  (map list args))
;;(define (make-divisionA-record name address position salary)
;;  (list
;;   (cons 'name name)
;;   (cons 'address address)
;;   (cons 'position position)
;;   (cons 'salary salary)))
;;(define (make-divisionB-record name position address salary)
;;  (list
;;   (list name (list position address salary))))


;; Examples of the records in various divisions
;;(define ins-div1-records
;;  (let ((mrec make-divisionA-record))
;;    (make-division-personnel-files
;;     (mrec "Ivan" "Some address" "developer" "millions")
;;     (mrec "Harry" "Another address" "manager" "billions"))))
;;(define ins-div2-records
;;  (let ((mrec make-divisionB-record))
;;    (make-division-personnel-files
;;     (mrec "Alyss" "complex number dev" "address 1" 10)
;;     (mrec "George" "complex nr dev" "address 2" 20))))

(define ins-div1-records
  (list
   (list (cons 'name "Ivan") (cons 'address "Some address") (cons 'position "developer") (cons 'salary "milions"))
   (list (cons 'name "Someone") (cons 'address "some address") (cons 'position "manager") (cons 'salary "bilions"))))

;; here we'll presume to hardcode the structure
(define ins-div2-records
  (list
   (list "Alyss" (list "complex number dev" "some address" 10))
   (list "George" (list "complex num. dev" "some address" 20))))


;; Tagging the file so that we know from which dept
;; the file originates
(define typed-ins1
  (attach-tag 'ins1-record ins-div1-records))

(define typed-ins2
  (attach-tag 'ins2-record ins-div2-records))

;; Some useful predicates
(define (ins1? file)
  (eq? (car file) 'ins1-record))
(define (ins2? file)
  (eq? (car file) 'ins2-record))

;; get-record procedure:
;; Retrieves a specified employee's record from
;; a specified personnel file.
(define (get-record file name)
  (cond ((ins1? file)
         (get-ins1-record (contents file) name))
        ((ins2? file)
         (get-ins2-record (contents file) name))))
;; get record in division 1
(define (get-ins1-record records name)
  (cond ((null? records) '())
        ((equal? name (cdaar records))
         (attach-tag 'ins1-record (car records)))
        (else (get-ins1-record (cdr records) name))))
;; get record in division 2
(define (get-ins2-record records name)
  (cond ((null? records) '())
        ((equal? name (caar records))
         (attach-tag 'ins2-record (car records)))
        (else (get-ins2-record (cdr records) name))))

;; test
(display (get-record typed-ins1 "Ivan"))
(newline)
(display (get-record typed-ins2 "George"))

;; get-salary procedure
;; Returns the salary information from a given employee's
;; record from any division's personnel file
(define (get-salary record)
  (cond ((ins1? record)
         (get-ins1-salary (contents record)))
        ((ins2? record)
         (get-ins2-salary (contents record)))))
(define (get-ins1-salary record)
  (cond ((null? record)
         (error "Invalid, doesn't contain salary information"))
        ((eq? 'salary (caar record))
         (cdar record))
        (else (get-ins1-salary (cdr record)))))
(define (get-ins2-salary record)
  (car (cddadr record)))

;; Test
(display (get-salary (get-record typed-ins1 "Ivan")))
(newline)
(display (get-salary (get-record typed-ins2 "George")))

;; Table of procedures
(define (get op type)
  (cond ((and (eq? op 'get-record) (eq? type 'ins1-record))
         get-ins1-record)
        ((and (eq? op 'get-record) (eq? type 'ins2-record))
         get-ins2-record)
        ((and (eq? op 'get-salary) (eq? type 'ins1-record))
         get-ins1-record)
        ((and (eq? op 'get-salary) (eq? type 'ins2-record))
         get-ins2-record)))

;; Making generic find record
(define (find-employee-record files name)
  (cond ((null? files) '())
        (else
         (let ((proc (get 'get-record (type-tag (car files)))))
           (let ((record (proc (contents (car files)) name)))
             (if (not (null? record))
                 (contents record)
                 (find-employee-record (cdr files))))))))

(display (find-employee-record (list typed-ins1 typed-ins2) "Ivan"))
