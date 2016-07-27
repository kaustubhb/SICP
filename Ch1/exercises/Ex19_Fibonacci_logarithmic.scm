; computing nth fibonacci number in logarithmic time

; This was a tough one!
; The iterative version reads like

; int fib2(int n) {
;     int p = 1, q = 0;   // transform = 1
;     int a = 0, b = 1;   // base = 0

;     while (n > 0) {
;         if (n % 2 == 0) {
;             int temp = p;
;             p = (p + q)*p + p*q;
;             q = temp*temp + q*q;
;             n = n / 2;
;         }
;         else {
;             int temp = a;
;             a = (p + q)*a + b*p;
;             b = p*temp + q*b;
;             --n;
;         }
;     }   
;     return a;
; }

; Here, the substitution looks like
; fib(n=10,base=0,z=1)
; fib(n=5,base=0,z=2)
; fib(n=4,base=2,z=2)
; ...

; Invariant:
; base + z*n => N


(define (fib n)
  (define (fib-iter n a b p q)
    (cond ((= n 0) a)
          ((even? n) (fib-iter (/ n 2)
                               a
                               b
                               (+ (* p p)
                                  (* 2 p q))
                               (+ (* p p)
                                  (* q q))))
          (else (fib-iter (- n 1)
                          (+ (* a p) (* a q) (* b p))
                          (+ (* p a) (* q b))
                          p
                          q))))
  (fib-iter n 0 1 1 0))

(fib 10)
                               
                  