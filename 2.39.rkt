#lang scheme


(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))



(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest)) (cdr rest))))
  (iter initial sequence))


(define (reverse-right sequence)
  (fold-right
   (lambda (x y)
     ;(append null (list 3))
     ;(append (3) (list 2))
     ;(append (3 2) (list 1))
     (append y (list x)))
   null
   sequence))


(define (reverse-left sequence)
  (fold-left
   (lambda (x y)
     ; (append 1 nul)
     ; (append 2 (1))
     ; (append 3 (2 1))
     (append (list y) x))
   null
   sequence))
  

(reverse-right (list 1 2 3))
(reverse-left (list 1 2 3))