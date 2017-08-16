;; Random numbers
;; The Benefits of Introducing Assignment

(define (rand-update x)
  (let ((a 6364136223846793005)
        (c 1442695040888963407)
        (m (expt 2 64)))
    (modulo (+ (* a x) c) m)))
(define (random-init)(rand-update 0))
(define rand
  (let ((x random-init))
    (lambda () (set! x (rand-update x)) x)))

(define (estimate-pi trials)
  (sqrt (/ 6 (monte-carlo trials
                          cesaro-test))))

(define (cesaro-test)
  (= (gcd (rand) (rand)) 1))

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

;; Same computation using rand-update directly rather
;; than rand, the way we would be forced to proceed if
;; we did not use assignment to model local state

(define (estimate-pi trials)
  (sqrt (/ 6 (random-gcd-test trials
                              random-init))))

(define (random-gcd-test trials initial-x)
  (define (iter trials-remaining
                trials-passed
                x)
    (let ((x1 (rand-update x)))
      (let ((x2 (rand-update x1)))
        (cond ((= trials-remaining 0)
               (/ trials-passed trials))
              ((= (gcd x1 x2) 1)
               (iter (- trials-remaining 1)
                     (+ trials-passed 1)
                     x2))
              (else
               (iter (- trials-remaining 1)
                     trials-passed
                     x2))))))
  (iter trials 0 initial-x))
