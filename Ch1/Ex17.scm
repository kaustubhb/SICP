; fast multiplication using only addition (recursive procedure)

(define (mult a b)
  (define (dbl d)
    (+ d d))
  (define (halve h)
    (/ h 2))
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (dbl (mult a (halve b))))
        (else (+ a (mult a (- b 1))))))

(mult 10 0)
; 0
(mult 10 20)
; 200