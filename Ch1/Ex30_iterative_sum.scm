#lang planet neil/sicp

(define (sum f a next b)
  (define (sum-iter start result)
    (if (> start b)
        result
        (sum-iter (next start) (+ result (f start)))))
  (sum-iter a 0))

; testing with simpson's rule for integration
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

(simpsons cube 0 1 10)
(simpsons cube 0 1 1000)


; testing with simple integer sum
(define (sum-integers n)
  (define (inc x) (+ x 1))
  (define (id x) x)
  (sum id 0 inc n))

(sum-integers 10)
        
