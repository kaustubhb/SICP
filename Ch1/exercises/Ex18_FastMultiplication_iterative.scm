; fast-multiplication, iterative process
; also called Russian peasant method

(define (mult a b)
  (define (dbl d)
    (+ d d))
  (define (halve h)
    (/ h 2))
  (define (m-iter a b temp)
    (cond ((= b 0) temp)
          ((even? b) (m-iter (dbl a) (halve b) temp))
          (else (m-iter a (- b 1) (+ temp a)))))
  (m-iter a b 0))
  

(mult 10 0)
; 0
(mult 10 20)
; 200