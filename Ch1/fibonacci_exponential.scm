; fibonacci exponential

(define (fibonacci n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fibonacci (- n 1)) (fibonacci (- n 2))))))

(fibonacci 10)
(fibonacci 20)
(fibonacci 30)
(fibonacci 40)

; the recursion tree has fibonacci(n+1) nodes for fibonacci(n)