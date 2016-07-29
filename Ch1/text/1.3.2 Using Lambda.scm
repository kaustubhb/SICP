#lang racket
(require "../../utils.scm")

(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

(* 8 (pi-sum 1 1000000))
; print approximately pi's value

;========================
(define (integral f a b n)
  (define dx (* 1.0 (/ (- b a) n)))
  (* dx
     (sum (lambda (x)
            (f (+ x (/ dx 2))))
          a
          (lambda (x) (+ x dx))
          b)))

(integral cube 0 1 10000)
; print approximately 0.25

;========================
; calling a lambda as soon as defining it
((lambda (x y z) (+ x y (square z))) 1 2 3)
; 12


