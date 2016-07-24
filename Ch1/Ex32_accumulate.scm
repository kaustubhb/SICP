#lang racket

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

; sum of n integers
(define (sum1 n)
  (define (combiner a b)
    (+ a b))
  (define null-value 0)
  (define (term x) x)
  (define (next x) (+ x 1))
  (accumulate combiner null-value term 1 next n))

(define (accumulate2 combiner null-value term a next b)
  (define (iter start result)
    (if (> start b)
        result
        (iter (next start) (combiner result (term start)))))
    (iter a null-value))

; sum of n integers
(define (sum2 n)
  (define (combiner a b)
    (+ a b))
  (define null-value 0)
  (define (term x) x)
  (define (next x) (+ x 1))
  (accumulate combiner null-value term 1 next n))

(sum1 10)
(sum2 10)
