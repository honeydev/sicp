#lang racket

(define (reverse l acc)
  (if (null? l) acc
      (reverse (cdr l) (cons (car l) acc))))
      

(define (deep-reverse l acc)
  (cond ((null? l) acc)
        ((list? (car l)) (deep-reverse (cdr l) (cons (deep-reverse (car l) null) acc)))
        (else (deep-reverse (cdr l) (cons (car l) acc)))))
(define x (list (list 1 2) (list 3 4)))

(deep-reverse (list 1 2 3 (list 4 5)  6 7 (list 8 9 10 (list 12 13 14 15 (list 16 17 18)))) null)