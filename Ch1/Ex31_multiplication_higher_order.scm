#lang racket

; recursive process
(define (product f a next b)
  (if (> a b)
      1
      (* (f a) (product f (next a) next b))))

; iterative process
(define (product2 f a next b)
  (define (iter start result)
    (if (> start b)
        result
        (iter (next start) (* result (f start)))))
  (iter a 1))

(define (factorial n)
  (define (id x) x)
  (define (inc x) (+ x 1))
  (product2 id 1 inc n))

(factorial 10)

(define (pi-quarter n)
  (define (tk k)
    (* 1.0 (if (even? k)
        (/ (+ k 2) (+ k 1))
        (/ (+ k 1) (+ k 2)))))
  (define (inc x) (+ x 1))
  (product2 tk 1 inc n))

(* 4 (pi-quarter 1000000))