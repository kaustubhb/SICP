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


(prime? 2)
(prime? 5)
(prime? 7)
(prime? 37)
(prime? 29)
(prime? 1000000000007)


(prime? 4)
(prime? 12)
(prime? 18)