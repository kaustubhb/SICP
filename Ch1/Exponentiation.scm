(define (exp1 b n)
  (if (= 0 n)
      1
      (* b (exp1 b (- n 1)))))

(exp1 10 50)
;(log (exp1 10 500000)) ; too big an exponent
;Above is a linear recursive process. Cannot be optimized by tail recursion
;(exp 10 3)
;(* 10 (exp 10 2))
;(* 10 (* 10 (exp 10 1)))
;...


(define (exp2 b n)
  (define (exp-iter n result)
    (if (= n 0)
        result
        (exp-iter (- n 1) (* result b))))
  (exp-iter n 1))

(exp2 10 50)
;(log (exp2 10 500000))

;Iterative process for above, but still linear in exponent.

(define (exp3 b n)
  (define (even? x)
    (= 0 (remainder x 2)))
  (define (square x)
    (* x x))
  (cond ((= n 0) 1)
        ((even? n) (square (exp3 b (/ n 2))))
        (else (* b (exp3 b (- n 1))))))

(exp3 10 50)
(log (exp3 10 5000000))





  