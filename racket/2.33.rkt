#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))



(define (even-fibs n)
  (accumulate cons
              null
              (filter even?
                      (map (lambda (x) (* x x))
                           (enumerate-interval 0 n)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) null sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length seq)
  (accumulate (lambda (x y) (+ 1 y)) 0 seq))

;(append (list 1 2 3) (list 4 5 6))

;(length (list 1 2 3 4 5 6))

