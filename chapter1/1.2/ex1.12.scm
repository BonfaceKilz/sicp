;; Exercise 1.12
;; Implementing Pascal's triangle

;; Example
;; Rows
;;  1  | 1
;;  2  | 1  1
;;  3  | 1  2  1
;;  4  | 1  3  3  1
;;  5  | 1  4  6  4  1
;;  ---------------------
;;cols   1  2  3  4  5

(define (pascal row col)
  (if (or (= col 1) (= col row))
      1
      (+
       (pascal (- row 1) (- col 1))
       (pascal (- row 1) col))))
