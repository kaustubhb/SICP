; Compute pascal's triangle's elements

(define (pascal row col)
  (cond ((or (= row 0) (= col 0) (> col row)) 0)
        ((and (= row 1) (= col 1)) 1)
        (else (+ (pascal (- row 1) col)
                 (pascal (- row 1) (- col 1))))))

; test
(pascal 1 1)
;1
(pascal 2 1)
;1
(pascal 5 3)
;6
(pascal 5 4)
;4