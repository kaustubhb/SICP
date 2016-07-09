; recursive process

(define (f1 n)
  (cond ((< n 3)  n)
        (else (+ (f1 (- n 1))
                 (* 2 (f1 (- n 2)))
                 (* 3 (f1 (- n 3)))))))

(f1 10)

; iterative
(define (f2 n)
  (define (f-iter a b c count)
    (if (= 0 count)
        c
        (f-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  (if (< n 3)
      n
      (f-iter 0 1 2 (- n 2))))

; substitution process for n=5
;(f2 5)
;(f-iter 0 1 2 3)
;(f-iter 1 2 4 2)
;(f-iter 2 4 11 1)
;(f-iter 4 11 25 0)
;25

(f2 1000)