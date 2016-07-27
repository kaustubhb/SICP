; calculating phi^n/sqrt(5) first

(define phi (/ (+ 1 (sqrt 5)) 2))

(define (f n)
  (/ (expt phi n) (sqrt 5)))

(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 6)
(f 7)
(f 8)

;Now the proof part
;
;Using the hint, prove that Fib(n) = (phi^n - psi^n)/sqrt(5)    [1]
;Proof outline:
;1. Prove base case of induction, easy
;2. Assume true for Fib(n)
;3. Prove for Fib(n+1)
;Fib(n+1)= Fib(n) + Fib(n-1)
;        = (phi^n - psi^n)/sqrt(5) + (phi^(n-1) - psi^(n-1))/sqrt(5)
;Use the property that
;  phi^2 = phi + 1
;Same property holds for psi also
;
;Now that above relation is proven, use this to prove Fib(n) is closest integer to phi^n/sqrt(5)
;Rearrange the terms of relation [1]
;abs(Fib(n) - phi^n/sqrt(5)) = abs(psi^n/sqrt(5))
;We need to prove RHS is always less than 0.5, which is trivial to prove














  