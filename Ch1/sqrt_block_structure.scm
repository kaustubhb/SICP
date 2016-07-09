;(define (square x) (* x x))
;
;(define (sqrt2 x) (sqrt-iter (/ x 2) 0 x))
;
;(define (sqrt-iter cur-guess prev-guess x)
;  (if (good-enough? cur-guess prev-guess x)
;      cur-guess
;      (sqrt-iter (improve-guess cur-guess x) cur-guess x)))
;
;; (delta/guess < 0.00001)
;(define (good-enough? cur-guess prev-guess x)
;;  (display (abs (- cur-guess prev-guess)))
;;  (display "\n")
;  (< (/ (abs (- cur-guess prev-guess)) cur-guess) 0.000001))
;
;(define (improve-guess guess x)
;  (/ (+ guess (/ x guess)) 2.0))


(define (sqrt2 x)
  (define (sqrt-iter guess prev)
    (if (good-enough? guess prev)
        guess
        (sqrt-iter (improve-guess guess) guess)))

  (define (good-enough? guess prev)
;    (display guess)
;    (display "\n")
    (< (/ (abs (- guess prev)) guess) 0.000001))

  (define (improve-guess guess)
    (/ (+ guess (/ x guess)) 2.0))

  (sqrt-iter (/ x 2) 0))

(sqrt2 2.0)
(sqrt2 100.0)
(sqrt2 3.0)
(sqrt2 5.0)