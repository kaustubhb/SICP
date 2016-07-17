(#%require (only racket/base current-milliseconds))
(#%require (only racket/base random))



(define (runtime) (current-milliseconds))

(define (square x) (* x x))

(define (expmod base p m)
  (cond ((= p 0) 1)
        ((even? p) (remainder (square (expmod base (/ p 2) m)) m))
        (else (remainder (* base (expmod base (- p 1) m)) m))))

(define (fermat-test n)
  (define (get-rand-below n)
    (if (< n 4294967087)
        (random (- n 1))
        (random 4294967086)))
    
  (define (test base)
    (= base (expmod base n n)))
  (test (+ 1 (get-rand-below n))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (prime? n)
  (fast-prime? n 20))



(define (timed-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time) #t)


(define (find-primes n k)
  (define (helper n k)
    (cond ((= n 0) (newline) (display "done"))
          ((timed-test k) (helper (- n 1) (+ k 2)))
          (else (helper n (+ k 2)))))
  (if (even? k)
      (helper n (+ k 1))
      (helper n k)))

(find-primes 3 10000000000)
(find-primes 3 100000000000)
(find-primes 3 1000000000000)
(find-primes 3 10000000000000)
(find-primes 3 100000000000000)
(find-primes 3 1000000000000000)
(find-primes 3 10000000000000000)
(find-primes 3 100000000000000000) ; still 0 msec
(find-primes 3 10000000000000000000000000000000000000000) ;4 msec
(find-primes 3 100000000000000000000000000000000000000000000000000000000000000000000000000000000) ; 16 msec
(find-primes 3 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) ;63 msec

; Growth is nearly linear on squaring the input. This is as expected from a logarithmic algorithm