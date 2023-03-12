#lang racket

(define (fringe l)
  (define (iter l acc)
    (if (empty? l)
        acc
        (let ([current (car l)]
              [next (cdr l)])      
          (cond ((null? current) acc)
                ((list? current) (iter next (iter current acc)))
                (else (iter next (cons current acc)))))))
  (reverse (iter l (list))))


(define x (list (list 1 2) (list 3 (list 5 6)) (list 7 8)))


(fringe x)
