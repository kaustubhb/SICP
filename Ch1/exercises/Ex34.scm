#lang racket
(require "../../utils.scm")

(define (f g)
  (g 2))

(f square)

; should be an error, as f applied to 2 doesn't make sense.
(f f)
