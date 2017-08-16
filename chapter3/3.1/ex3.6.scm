;; Exercise 3.6

;; It is useful to be able to reset a random number generator to
;; produce a sequence starting from a given value. Design a new rand
;; procedure that is called with an argument that is either the
;; symbol generate or the symbol reset and behaves as follows:
;; (rand 'generate) produces a new random number;
;; ((rand 'reset) <new value>) resets the internal state variable
;; to the designated <new-value>. Thus, by resetting the state, one
;; can generate repeatable sequences. These are handy to have when
;; debugging programs that use random numbers.

(define (rand-update x)
  (let ((a 6364136223846793005)
        (c 1442695040888963407)
        (m (expt 2 64)))
    (modulo (+ (* a x) c) m)))
(define rand
  (let ((x 0))
    (define (dispatch m)
      (cond ((eq? m 'generate)
             (begin (set! x (rand-update x))
                    x))
            ((eq? m 'reset)
             (lambda (seed)
               (begin (set! x seed)
                      seed)))
            (else
             (error "Unkown message --" m))))
    dispatch))
