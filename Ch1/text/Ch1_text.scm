(define (abs2 x) (cond ((> x 0) x)
                       (else (- x))))

(define (abs3 x) (if (< x 0)
                     (- x)
                     x))

(define (square x) (* x x))

;; Newton's method for square root computation

(define (sqrt2 x) (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve-guess guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (improve-guess guess x)
  (/ (+ guess (/ x guess)) 2.0))

;; test

(sqrt2 2.0)
(sqrt2 100.0)
(sqrt2 3.0)
(sqrt2 5.0)
(sqrt2 0.000000000036)  ; gives wrong answer
(sqrt2 100000000000.0)
;(sqrt2 10000000000000.0)  ;; hangs
  
      