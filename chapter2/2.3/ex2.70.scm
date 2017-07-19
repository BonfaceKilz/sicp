;; Exercise 2.70

(load "ex2.69.scm")

(define rock-encoding
  (car
   (generate-huffman-tree
    (list
     (list 'NA 16)
     (list 'YIP 9)
     (list 'SHA 3)
     (list 'GET 2)
     (list 'JOB 2)
     (list 'A 2)
     (list 'BOOM 1)
     (list 'WAH 1)))))

;; Encoding various messages
(display (encode '(Get a job) rock-encoding))
(newline)
(display (encode '(Sha na na na na na na na na) rock-encoding))
(newline)
(display (encode '(Get a job) rock-encoding))
(newline)
(display (encode '(Sha na na na na na na na na) rock-encoding))
(newline)
(display (encode '(Wah yip yip yip yip) rock-encoding))
(newline)
(display (encode '(yip yip yip yip yip) rock-encoding))
(newline)
(display (encode '(Sha boom) rock-encoding))

;; 84 occurences
