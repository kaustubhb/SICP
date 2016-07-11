(define (sine angle)
  (define (cube x)
    (* x x x))
  (define (p x)
    (- (* 3 x)
       (* 4 (cube x))))
  (if (< angle 0.1)
      angle
      (p (sine (/ angle 3)))))

(sine 12.15)
(sine 3.141)
(sine 1.57)

; check how many times p is called
(define (dummy x count)
  (if (< x 0.1)
      count
      (dummy (/ x 3) (+ 1 count))))

(dummy 12.15 0)

;So, p is called 5 times

;Order of growth is logarithmic in both space and time.