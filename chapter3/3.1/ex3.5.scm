;; Exercise 3.5
;; Monte Carlo integration is a method of estimating definite
;; integrals by means of Monte Carlo simulation. Consider computing
;; the area of a region of space described by a predicate P(x,y)
;; that is true for points (x,y) in the region and false for points
;; not in the region.  For example, the region contained within a
;; circle of radius 3 centered at (5,7) is described by the predicate
;; that tests whether (x-5)^2 + (y-7)^2 <= 3^2. To estimate the area
;; of the region described by such a predicate, begin by choosing a
;; rectangle with diagonally opposite corners at (2,4) and (8,10)
;; contains the circle above. The desired integral is the area of that
;; portion of the rectangle that lies in the region. We can estimate
;; the integral by picking, at random, points (x,y) that lie in the
;; rectangle, and testing P(x,y) for each point to determine whether
;; the point lies in the region. If we try this with many points, then
;; the fraction of points that fall in the region should give an
;; estimate of the proportion of the rectangle that lies in the region.
;; Hence, multiplying this fraction by the area of the entire rectangle
;; should produce an estimate of the integral.

;; Implement Monte Carlo integration as a procedure estimate-integral
;; that takes as arguments a predicate P, upper and lower bounds x1,
;; x2, y1, and y2 for the rectangle, and the number of trials to
;; perform in order to produce the estimate. Your procedure should use
;; the same monte-carlo procedure that was used to estimate 𝞹 by
;; measuring the area of a unit circle.

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (predicate-for-circle a b r)
  (lambda (x y)
    (let ((dx (- a x))
          (dy (- b y)))
      (let ((distance-from-center (sqrt (+ (square dx) (square dy)))))
        (<= distance-from-center r)))))

(define predicate-for-unit-circle
  (predicate-for-circle 0 0 1))

(define (average a b)
  (/ (+ a b) 2))

(define (estimate-integral predicate x1 x2 y1 y2 trials)
  (let ((x1f (* 1.0 x1))
        (x2f (* 1.0 x2))
        (y1f (* 1.0 y1))
        (y2f (* 1.0 y2)))
    (define (estimate-integral-test)
      (let ((x (random-in-range x1f x2f))
            (y (random-in-range y1f y2f)))
        (predicate x y)))
    (let ((area-rect (* (- x2 x1) (- y2 y1))))
      (* area-rect (monte-carlo trials estimate-integral-test)))))

(define (estimate-pi trials)
  (let ((x1 -1.0)
        (x2 1.0)
        (y1 -1.0)
        (y2 1.0))
    (estimate-integral predicate-for-unit-circle x1 x2 y1 y2 trials)))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1)
                 trials-passed))))
  (iter trials 0))
