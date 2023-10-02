#lang racket


(define (scale-tree-plain tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (* tree tree))
        (else (cons
               (scale-tree-plain (car tree))
               (scale-tree-plain (cdr tree))))))

(define (scale-tree-high-order tree)
  (map (lambda (sub-tree-or-value)
         (if (pair? sub-tree-or-value)
             (scale-tree-high-order sub-tree-or-value)
             (* sub-tree-or-value sub-tree-or-value)))
       tree))
             

(scale-tree-plain (list (list 1 2) (list 3 4)))
(scale-tree-high-order (list (list 1 2) (list 3 4)))

