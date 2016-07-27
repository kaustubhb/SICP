#lang racket

(define (runtime) (current-milliseconds))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (define (next-divisor d)
    (if (= d 2)
        (+ d 1)
        (+ d 2)))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next-divisor test-divisor)))))
  (define (square x) (* x x))
  (define (divides? t n) (= 0 (remainder n t)))
  (find-divisor n 2))

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

; This algorithm is clearly O(sqrt(n)), as on multiplying the base by 100, runtime is multiplied by 10
;Ex 22
;10000000019 *** 15
;10000000033 *** 32
;10000000061 *** 15
;done
;100000000003 *** 47
;100000000019 *** 47
;100000000057 *** 47
;done
;1000000000039 *** 172
;1000000000061 *** 311
;1000000000063 *** 161
;done
;10000000000037 *** 604
;10000000000051 *** 559
;10000000000099 *** 568
;done

;Ex 23
;The speedup was not 2x, but approximately 1.5x, as extra if statements have to evaluated now.

