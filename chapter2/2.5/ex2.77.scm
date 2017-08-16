;; Exercise 2.77
;; Louis Reasoner tries to evaluate the expression (magnitude z).
;; To his surprise, instead of the answer 5 he gets an error
;; message from apply-generic, saying there is no method for the
;; operation magnitude on the types (complex). He shows his interaction
;; to Allys P. Hacker, who says "The problem is that the complex-number
;; selectors were never defined for complex numbers, just for polar and
;; rectangular numbers. All you have to do to make this work is add the
;; following to the complex package."

;; (put 'real-part '(complex) real-part)
;; (put 'imag-part '(complex) imag-part)
;; (put 'magnitude '(complex) magnitude)
;; (put 'angle '(complex) angle)

;; Adding these methods in the complex package exposes them to the
;; outside.

;; In evaluating (magnitude z), we use the definition of magnitude
;; that was imported from the rectangular/ polar package. Here is the
;; trace through:

;; (magnitude z)
;; (apply-generic 'magnitude z)
;; (apply magnitude (map contents (list z)))
;; (apply magnitude (list '(rectangular 3 . 4)))
;; (magnitude '(rectangular 3 . 4))
;; (apply-generic 'magnitude '(rectangular 3 . 4))
;; (apply magnitude (map contents '(rectangular 3 . 4)))
;; (apply magnitude '((3 . 4)))
;; (magnitude 3 . 4)
;; (sqrt (+ (square (real-part (3 . 4)))
;;          (square (imag-part (3 . 4)))))
;; (sqrt (+ (square 3) (square 4)))
;; (sqrt (+ 9 16))
;; (sqrt 25)
;; 5
