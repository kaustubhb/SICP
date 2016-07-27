(#%require (only racket/base random))

(define (square x) (* x x))

(define (expmod base p m)
  (cond ((= p 0) 1)
        ((even? p) (remainder (square (expmod base (/ p 2) m)) m))
        (else (remainder (* base (expmod base (- p 1) m)) m))))

(define (fermat-test n)
  (define (test base)
    (= base (expmod base n n)))
  (test (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(fast-prime? 561 5)