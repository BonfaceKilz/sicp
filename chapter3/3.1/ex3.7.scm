;; Exercise 3.7

;; Consider the bank account objects created by make-account, with
;; the password modification described in Exercise 3.3. Suppose
;; that our banking system requires the ability to make joint accounts.
;; Define a procedure make-joint that accomplishes this. Make-joint
;; should take three arguments. The first is a a password-protected
;; account. The second argument must match the password with which the
;; account was defined in order for the make-joint operation to
;; proceed. The third argument is a new password. Make-joint is to
;; create an additional access to the original account using the new
;; password. For example, if peter-acc is a bank account with password
;; open-sesame, then

;; (define paul-acc
;;    (make-joint peter-acc
;;         'open-sesame
;;         'rosebud))

;; will allow one to make transactions on peter-acc using the name
;; paul-acc and the password rosebud. You may wish to modify your
;; solution to Exercise 3.3 to accomodate the new feature

(define (make-joint account password new-password)
  ((account password 'make-joint) new-password))

(define (make-account balance password)
  (let ((pwd-list (list password)))
    ;; withdraw procedure
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance
                   (- balance amount))
                 balance)
          "Insufficient funds"))

    ;; deposit precedure
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)

    ;; make-joint procedure
    (define (make-joint pwd)
      (set! pwd-list (cons pwd pwd-list))
      dispatch)

    ;; dispatch procedure
    (define (dispatch pwd m)
      (if (memq pwd pwd-list)
          (cond ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                ((eq? m 'make-joint) make-joint)
                (else (error "Unknown request: MAKE-ACCOUNT" m)))
          (error "Incorrect password" pwd)))
    dispatch))


(define peter-acc (make-account 1000 'open-sesame))

((peter-acc 'open-sesame 'withdraw) 100)

(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))

((paul-acc 'rosebud 'deposit) 300)
