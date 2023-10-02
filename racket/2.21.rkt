#lang racket

(define (square-list-non-abstract items)
  (if (empty? items)
      null
      (cons (expt (car items) 2) (square-list-non-abstract (cdr items)))))


(define (square-list-before-map items)
  (map (lambda (x) (expt x 2)) items))

(square-list-non-abstract (list 1 2 3 4 5))
(square-list-before-map (list 1 2 3 4 5))