(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve-guess guess x) x)))
;

;This will be infinite recursion as the new-if is like a procedure.
;All the arguments are evaluated before function body is executed.
;The else-clause when executed will cause infinite recursion due to applicative-order-evaluation.