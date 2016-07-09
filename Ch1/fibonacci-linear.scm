(define (fibonacci n)
  (define (fibonacci-iter a b count)
    (if (= 0 count)
        b
        (fibonacci-iter b (+ a b) (- count 1))))
  (fibonacci-iter 1 0 n))

(fibonacci 5)
(fibonacci 10)
(fibonacci 50)
(fibonacci 100)
(fibonacci 1000)

;; substitution process
;(fibonacci 5)
;(fib-iter 1 0 5)
;(fib-iter 0 1 4)
;(fib-iter 1 1 3)
;(fib-iter 1 2 2)
;(fib-iter 2 3 1)
;(fib-iter 3 5 0)
;5