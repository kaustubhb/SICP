;Exercise 1.7: The good-enough? test used in computing square
;roots will not be very effective for finding the square roots of very
;small numbers. Also, in real computers, arithmetic operations are
;almost always performed with limited precision. This makes our
;test inadequate for very large numbers. Explain these statements,
;with examples showing how the test fails for small and large numbers.
;An alternative strategy for implementing good-enough? is to
;watch how guess changes from one iteration to the next and to
;stop when the change is a very small fraction of the guess. Design
;a square-root procedure that uses this kind of end test. Does this
;work better for small and large numbers?

(define (square x) (* x x))

(define (sqrt2 x) (sqrt-iter (/ x 2) 0 x))

(define (sqrt-iter cur-guess prev-guess x)
  (if (good-enough? cur-guess prev-guess x)
      cur-guess
      (sqrt-iter (improve-guess cur-guess x) cur-guess x)))

; (delta/guess < 0.00001)
(define (good-enough? cur-guess prev-guess x)
;  (display (abs (- cur-guess prev-guess)))
;  (display "\n")
  (< (/ (abs (- cur-guess prev-guess)) cur-guess) 0.000001))

(define (improve-guess guess x)
  (/ (+ guess (/ x guess)) 2.0))

;; test

(sqrt2 2.0)
(sqrt2 100.0)
(sqrt2 3.0)
(sqrt2 5.0)

(sqrt2 0.000000000036)    ; this gives wring value with previous approach
(sqrt2 100000000000.0)
(sqrt2 10000000000000.0)  ; this will hang with previous approach



