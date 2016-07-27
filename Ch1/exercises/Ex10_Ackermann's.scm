; Ackermann's function

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

;testing
(A 1 10)

;(A 1 5)
;(A 0 (A 1 4))
;(A 0 (A 0 (A 1 3)))
;(A 0 (A 0 (A 0 (A 1 2))))
;(A 0 (A 0 (A 0 (A 0 (A 0 1)))))
;(A 0 (A 0 (A 0 (A 0 2))))
;(A 0 (A 0 (A 0 4)))
;(A 0 (A 0 8))
;(A 0 16)
;32

;(A 2 4)
;(A 1 (A 2 3))
;(A 1 (A 1 (A 2 2)))
;(A 1 (A 1 (A 1 (A 2 1))))
;(A 1 (A 1 (A 1 2)))
;(A 1 (A 1 (A 0 (A 1 1))))
;(A 1 (A 1 (A 0 2)))
;(A 1 (A 1 4))
;(A 1 (A 0 (A 1 3)))
;(A 1 (A 0 (A 0 (A 1 2))))
;(A 1 (A 0 (A 0 4)))
;(A 1 (A 0 8))
;(A 1 16)
;....
;2^16

(A 3 3)
;(A 2 (A 3 2))
;(A 2 (A 2 (A 3 1)))
;(A 2 (A 2 2))
;...
;(A 2 4)
;..
;65536

(define (f n)
  (A 0 n))
; equivalent to 2*n

(define (g n)
  (A 1 n))
; equivalent to 2^n

(define (h n)
  (A 2 n))
; equivalent to 2^2^2^.. (n-1 time raised)
