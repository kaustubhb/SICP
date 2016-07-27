#lang racket

(define (filtered-accumulate filter? combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (if (filter? a) (term a) null-value)
                (filtered-accumulate filter? combiner null-value term (next a) next b))))

(define (prime? n)
  (and (not (= n 1)) (= n (smallest-divisor n))))

(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ 1 test-divisor)))))
  (define (square x) (* x x))
  (define (divides? t n) (= 0 (remainder n t)))
  (find-divisor n 2))

; sum of primes upto n
(define (sum-primes n)
  (define (add x y) (+ x y))
  (define (sqr x) (* x x))
  (define (inc x) (+ x 1))
  (filtered-accumulate prime? add 0 sqr 1 inc n))

(sum-primes 5)

; gcd
(define (gcd-euclid a b)
  (if (= 0 b)
      a
      (gcd-euclid b (remainder a b))))

; product of all numbers co-prime to n, below n
(define (product-coprimes n)
  (define (coprime-n? x)
    (= 1 (gcd-euclid n x)))
  (define (prod x y) (* x y))
  (define (id x) x)
  (define (next x) (+ x 1))
  (filtered-accumulate coprime-n? prod 1 id 1 next (- n 1)))

(product-coprimes 10)


