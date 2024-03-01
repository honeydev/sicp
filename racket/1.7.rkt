#lang racket

(define (average a b) (/ (+ a b) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess previous-guess)
  (< (abs (- guess previous-guess)) 0.001))

(define (sqrt-iter previous-guess guess x)
  (if (good-enough? previous-guess guess)
      guess
      (sqrt-iter guess (improve guess x) x)))

(println (sqrt-iter 0.5 1 100))
