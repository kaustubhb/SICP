(define (gcd-euclid a b)
  (if (= 0 b)
      a
      (gcd-euclid b (remainder a b))))

(gcd-euclid 5 3)
(gcd-euclid 3 5)
(gcd-euclid 15 25)
(gcd-euclid 48 36)
(gcd-euclid 1 7)