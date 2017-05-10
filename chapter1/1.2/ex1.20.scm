;; Exercise 1.20
;;
;; The process that a procedure generates is dependent on the rules used by the interpreter
;; Consider the iterative gcd process

(load gcd.scm)

(gcd 206 40)

;; Comments:
;; The applicative-order evaluation generates fewer processes than the normal-order evaluation
