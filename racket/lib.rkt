#lang racket
(provide
 enumerate-interval
 accumulate
 flatmap
 all?
 )

(define (enumerate-interval a b)
  (range a (+ b 1)))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (permutations s)
  (if (null? s) ; пустое множество?c
      (list null)
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))


(define (all? l [predicate (lambda (x) #t)])
  (cond ((empty? l) #t)
        ((not (predicate (car l))) #f)
        (else (all? (cdr l) predicate))))
