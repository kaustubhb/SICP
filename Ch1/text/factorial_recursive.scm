(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

;; tests

(factorial 5)
(factorial 10)
(factorial 100)
(factorial 1000)


;;Applying substitution model on computation of factorial 5
;
;(fact 5)
;(* 5 (fact 4))
;(* 5 (* 4 (fact 3)))
;(* 5 (* 4 (* 3 (fact 2))))
;(* 5 (* 4 (* 3 (* 2 (fact 1)))))
;(* 5 (* 4 (* 3 (* 2 (* 1 (fact 0))))))
;(* 5 (* 4 (* 3 (* 2 (* 1 1)))))
;(* 5 (* 4 (* 3 (* 2 1))))
;(* 5 (* 4 (* 3 2)))
;(* 5 (* 4 6))
;(* 5 24)
;120


