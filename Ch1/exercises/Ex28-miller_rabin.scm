#lang planet neil/sicp

; Miller rabin primality test
; same as the expmod method in little fermat theorem, except for additional "test-miller" function before squaring

(define (expmod a b m)
  (define (square x) (* x x))

  ; returns 0 if x is a "non-trivial square root" of 1 modulo m (actually m is same as number under test, n)
  ; x is Non trivial square root of 1 modulo n, if x != 1 and x != n-1, but x^2 is congruent to 1 modulo n
  (define (test-miller x)
    (cond ((or (= x 1) (= x (- m 1))) x)
          ((= 1 (remainder (square x) m)) 0)
          (else x)))
  
  (cond ((= b 0) 1)
        ((even? b) (remainder (square (test-miller (expmod a (/ b 2) m) )) m))
        (else (remainder (* a (expmod a (- b 1) m)) m))))

(define (miller-rabin-test n a)
  (= 1 (expmod a (- n 1) n)))

; returns true if n is prime
(define (test-with-randoms n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n (+ 1 (random (- n 1))))
         (test-with-randoms n (- times 1)))
        (else #f)))

; testing n with at max 20 random numbers less than n
(define (prime? n)
  (define (min a b)
    (if (< a b) a b))
  (test-with-randoms n (min 20 (- n 2))))

;(prime? 2)

; check for all primes till 100
(define (test-primes count)
  (cond ((= count 1) )
        ((prime? count) (display count) (newline) (test-primes (- count 1)))
        (else (test-primes (- count 1)))))

; print all primes below 1000
(test-primes 1000)
  