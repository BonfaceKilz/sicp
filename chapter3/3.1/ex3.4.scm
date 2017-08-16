;; Exercise 3.4

;; Modify the make-account procedure of Exercise 3.3 by adding
;; another local state variable so that, if an account is accessed
;; more than seven consecutive times with an incorrect password, it
;; invokes the procedure call-the-cops

(define (make-account balance password)
  (let ((pwd password)
        (counter 0))
      (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance
                     (- balance amount))
                   balance)
            "Insufficient funds"))
      (define (call-the-cops x)
        (error "call the cops"))
      (define (deposit amount)
        (set! balance (+ balance amount))
        balance)
      (define (dispatch pwd m)
        (if (eq? pwd 'secret-password)
            (cond ((eq? m 'withdraw) withdraw)
                  ((eq? m 'deposit) deposit)
                  (else (error "Unknown request: MAKE-ACCOUNT" m)))
            (begin
              (set! counter (+ 1 counter))
              (if (> counter 7)
                  call-the-cops
                  (lambda (x) (display "Incorrect password"))))))
      dispatch))

(define account (make-account 100 'secret-password))
