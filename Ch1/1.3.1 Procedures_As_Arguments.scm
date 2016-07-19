#lang planet neil/sicp

; sum of all numbers from a to b (1)
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

;(sum-integers 1 10)

(define (cube x) (* x x x))

; sum of all cubes from a to b  (2)
(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

;(sum-cubes 1 3)
; pi/8               (3)
(define (pi-sum a b)  (
  (define (pi-term a)
    (/ 1.0 (* a (+ a 2))))
  (if (> a b)
      0
      (+ (pi-term a) (pi-sum (+ a 4) b))))

(define (pi)
  (* 8 (pi-sum 1 1000)))

 (pi)











  