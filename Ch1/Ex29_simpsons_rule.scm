#lang planet neil/sicp

; define generic sum method below
(define (sum transform a next b)
  (if (> a b)
      0
      (+ (transform a) (sum transform (next a) next b))))

; simpson's rule is easy to prove if you try to fit a parabola between 3 succcessive points (y0,y1 and y3) 

(define (simpsons f a b n)
  (define h (* 1.0 (/ (- b a) n)))
  (define (transform k)
    (* (cond ((or (= k 0) (= k n)) 1)
             ((even? k) 2)
             (else 4))
       (f (+ a (* h k)))))
  (define (next x) (+ x 1))
  (* (/ h 3) (sum transform 0 next n)))

(define (cube x) (* x x x))

(simpsons cube 0 1 100)
(simpsons cube 0 1 1000)