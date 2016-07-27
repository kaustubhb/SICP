(define (square x) (* x x))

(define (max2 a b) (if (> a b) a b))

(define (max3 a b c) (max2 a (max2 b c)))

;(define (sumSqMax2 a b c)
;  ( + (square (max3 a b c))
;      (square (cond ((or (and (> a b) (< a c)) (and (< a b) (> a c))) a)
;                    ((or (and (> b a) (< b c)) (and (< b a) (> b c))) b)
;                    (else c)))))

;(define (sumSqMax2 a b c)
;  ( + (square (max3 a b c))
;      (square (if (> a b)
;                  (if (> b c)
;                       b
;                       (if (> a c) c a))
;                  (if (> c b) 
;                      b
;                      (if (a > c) a c))))))

; sum of sqaures of 2 larger numbers

(define (squareSum a b) (+ (square a) (square b)))

(define (sumSqMax2 a b c)
  (if (= a (max2 a b))
      (squareSum a (max2 b c))
      (squareSum b (max2 a c))))

;; Testing

(sumSqMax2 1 2 3)
;; 13

(sumSqMax2 2 3 4)
;; 25

(sumSqMax2 3 2 1)
;; 13