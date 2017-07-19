;; Exercise 2.69
;; Generating a list of symbol-frequency pairs
;; and generating a Huffman encoding tree according
;; to the Huffman algorigthm

(load "ex2.68.scm")
(define (generate-huffman-tree pairs)
  (successive-merge
   (make-leaf-set pairs)))

;; successive-merge merges the smallest weight elements
;; of the set until there is only one element left which
;; is the desired Huffman tree
(define (successive-merge leaf-set)
  (if (null? (cdr leaf-set))
      leaf-set
      (successive-merge
       (adjoin-set
        (make-code-tree (car leaf-set) (cadr leaf-set))
        (cddr leaf-set)))))

;; Tests
(define encoding-tree
  (car
   (generate-huffman-tree
    (list
     (list 'A 4)
     (list 'B 2)
     (list 'C 1)
     (list 'D 1)
     (list 'E 1)
     (list 'F 1)
     (list 'G 1)
     (list 'H 1)))))

(display (encode '(F H B A B) encoding-tree))
(newline)
(display (decode '(0 0 0 1 1 1 0 1 1 0 1 0 1 1 0 0) encoding-tree))
