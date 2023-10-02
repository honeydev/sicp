#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))


(define l  (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define x (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
  
 (define (dot-product v1 v2) 
   (accumulate + 0 (map * v1 v2)))

(dot-product (list 1 2 3) (list 4 5 6))

(define (matrix-*-vector m v)
  (map (lambda (c) (dot-product c v)) m))

(define (transponse mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transponse n)))
    (map (lambda (row) (map (lambda (col) (dot-product row col)) cols)) m)))

(matrix-*-matrix l x)

