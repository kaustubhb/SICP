(define (cube-root x) (cube-root-iter (/ x 2) 0 x))

(define (cube-root-iter guess prev x)
  (if (good-enough? guess prev x)
      guess
      (cube-root-iter (improve-guess guess x) guess x)))

(define (good-enough? guess prev x)
  (< (abs (/ (- guess prev) guess)) 0.00001))

(define (improve-guess guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3.0))

;; testing
(cube-root 8000)
(cube-root .000000000008)
(cube-root 1000000000000000)
(cube-root 124232321213242453434)