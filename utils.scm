#lang racket

(provide square)
(define (square x) (* x x))

(provide cube)
(define (cube x) (* x x x))

(provide sum)
(define (sum transform a next b)
  (if (> a b)
      0
      (+ (transform a) (sum transform (next a) next b))))