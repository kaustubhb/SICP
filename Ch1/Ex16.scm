; fast exponentiation, iterative process

(define (fast-exp b n)
  (define (exp-iter b n temp)
    (cond ((= n 0) temp)
          ((even? n) (exp-iter (* b b) (/ n 2) temp))
          (else (exp-iter b (- n 1) (* temp b)))))
  (exp-iter b n 1))

(fast-exp 2 10)
(log (fast-exp 10 5000000))