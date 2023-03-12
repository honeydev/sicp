#lang racket

(define (square x) (* x x))

(define (tree-map fn tree)
  (map (lambda (sub-tree-or-value)
         (if (pair? sub-tree-or-value)
             (tree-map fn sub-tree-or-value)
             (fn sub-tree-or-value))) tree))

(define (square-tree tree) (tree-map square tree))
             
(tree-map square (list (list 1 2) (list 3 4)))
