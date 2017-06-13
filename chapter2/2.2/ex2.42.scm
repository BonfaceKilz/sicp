;; Exercise 2.42
;; Eight queens puzzle
;; Place 8 queens on a chessboard so that no queen is
;; in check from any other(i.e no queens are in the same
;; row, column,)

;; a possible solution is to work across the board, placing
;; a queen in each column. Once you have placed k - 1  queens,
;; we must place the k^th queen in a position where it does
;; not check any of the queens already on the board.

;; A recursive approach:
;; Assume that we have already generated the sequence of all
;; possible ways to place k - 1 queens in the first k - 1 columns
;; of the board. For each of these ways, generate an extended set
;; of positions by placing a queen in each row of the k^th
;; column.

;; For each of these ways, generate an extended set of positions
;; by placing a queen in each row of the k^th column. Now filter
;; these, keeping only the positions for which the queen in the
;; k^th column is safe with respect to the other queens. This
;; produces the sequence of all ways to place k queens in the first
;; k columns. By continuing this process, we will produce not only
;; one solution, but all solutions to the puzzle.

(load "nested-mappings.scm")

(define empty-board `())

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions)
	   (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position
		    new-row
		    k
		    rest-of-queens))
		 (enumerate-interval
		  1
		  board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))
  
(define (make-position row column)
  (cons row column))

(define (row<- position)
  (car position))

(define (column<- position)
  (cdr position))

(define (extend-position-list position position-list)
  (cons position position-list))

(define (position-list-new-queen<- position-list)
  (car position-list))

(define (position-list-rest-queens<- position-list)
  (cdr position-list))

(define (position-is-single? position-list)
  (null? (cdr position-list)))

(define (adjoin-position new-row k rest-of-queens)
  (extend-position-list (make-position new-row k) rest-of-queens))

(define (safe? k positions)
  (if (position-is-single? positions)
      true
      (not (colides?
	    (position-list-new-queen<- positions)
	    (position-list-rest-queens<- positions)))))

(define (colides? position rest-of-positions)
  (or (collides-row? position rest-of-positions)
      (collides-diagonal? position rest-of-positions)))

(define (collides-row? position rest-of-positions)
  (not (null? (filter (lambda (rest-position)
			(= (row<- position) (row<- rest-position)))
		      rest-of-positions))))

(define (collides-diagonal? position rest-of-positions)
  (or (collides-upper-diagonal? position rest-of-positions)
      (collides-lower-diagonal? position rest-of-positions)))

(define (collides-upper-diagonal? position rest-of-positions)
  (not (null?
	(filter (lambda (rest-position)
		  (= (column<- rest-position)
		     (+ (- (column<- position) (row<- position))
			(row<- rest-position))))
		rest-of-positions))))

(define (collides-lower-diagonal? position rest-of-positions)
  (not (null?
	(filter (lambda (rest-position)
		  (= (column<- rest-position)
		     (+ (- (column<- position) (row<- rest-position))
			(row<- position))))
		rest-of-positions))))

(display (queens 4))
