#lang planet neil/sicp

; define generic sum method below
(define (sum transform a next b)
  (if (> a b)
      0
      (+ (transform a) (sum transform (next a) next b))))

; use above to calculate (1)
(define (sum-integers a b)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (sum identity a inc b))
;(sum-integers 1 10)

; calculate sum of cubes
(define (sum-cubes a b)
  (define (cube x) (* x x x))
  (define (inc x) (+ x 1))
  (sum cube a inc b))
;(sum-cubes 1 3)

; calculate pi/8
(define (pi-sum a b)
  (define (transform a)
    (/ 1.0 (* a (+ 2 a))))
  (define (next x) (+ 4 x))
  (sum transform a next b))
(* 8 (pi-sum 1 100000))

; calculate definite integral of f(x)
(define (integral f a b dx)
  (define (transform x)
    (f (+ (/ dx 2) x)))
  (define (next x) (+ x dx))
  (* dx (sum transform a next b)))

(define (cube x) (* x x x))
(integral cube 0 1 0.01)
