; Carmichael numbers
; 561 1105 1729 2465 2821 6601
(#%require (only racket/base random))

(define (square x) (* x x))

(define (expmod base p m)
  (cond ((= p 0) 1)
        ((even? p) (remainder (square (expmod base (/ p 2) m)) m))
        (else (remainder (* base (expmod base (- p 1) m)) m))))

(define (prime? n)    
  (define (test base)
    (= base (expmod base n n)))
  (define (fermat-iter a)
    (cond ((= a 1) #t)
          ((test a) (fermat-iter (- a 1)))
          (else #f)))
  (fermat-iter (- n 1)))

(prime? 561)
(prime? 1105)
(prime? 1729)
(prime? 2821)
(prime? 6601)