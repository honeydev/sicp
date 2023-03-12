#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define x (cons (list 1 (list 2 5)) (list 3 4)))



;(define (flat-tree t)
; (define (flat t acc)
;    (if (pair? t)
;        (append acc (flat-tree (car t)) (flat-tree (cdr t)))
;       (if (null? t)
;           acc
;            (append acc (list t)))))
;
;  (flat t '()))

(define (flat-tree t)
  (cond ((null? (cdr t))
         (if (pair? (car t))
             (flat-tree (car t))
             t))
        ((not (pair? (car t))) (cons (car t) (flat-tree (cdr t))))
        (else (append (flat-tree (car t)) (flat-tree (cdr t))))))
             

(define (count-leaves t)
  (accumulate (lambda (v acc) (+ v acc)) 0 (map (lambda (x) 1) (flat-tree t))))

(flat-tree x)
(count-leaves x)
