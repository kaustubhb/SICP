(define (factorial n)
  (define (fact-iter x result)
    (if (= 0 x)
        result
        (fact-iter (- x 1) (* x result))))
  (fact-iter n 1))

(factorial 5)
(factorial 10)
(factorial 100)
(factorial 1000)


;; Applying substitution model, iterative process
;(fact 5)
;(fact-iter 5 1)
;(fact-iter 4 5)
;(fact-iter 3 20)
;(fact-iter 2 60)
;(fact-iter 1 120)
;(fact-iter 0 120)
;120
