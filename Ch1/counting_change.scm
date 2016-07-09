; no of ways to create n using denominations of 1, 5, 10, 25, 50

(define (count-change n)
  (define INF 10000)
  (define (count-with-denominations n d)
    (cond ((< n 0) 0)
          ((< d 0) 0)
          ((= 0 n) 1)
          (else (+ (count-with-denominations (- n (get-denomination d)) d)
                   (count-with-denominations n (- d 1))))))
  (define (get-denomination d)
    (cond ((= d 0) 1)
          ((= d 1) 5)
          ((= d 2) 10)
          ((= d 3) 25)
          ((= d 4) 50)
          (else INF) ))
  (count-with-denominations n 4))

(count-change 100)
; 292