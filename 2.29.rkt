#lang racket


(define (make-mobile left right)
  (list left right))


(define (make-branch length structure)
  (list length structure))

(define (left-branch branch)
  (car branch))

(define (right-branch branch)
  (cadr branch))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))


(define m
  (make-mobile
   (make-branch 1 (make-mobile (make-branch 2 (make-mobile (make-branch 3 4) (make-branch 5 6))) (make-branch 9 10)))
   (make-branch 11 (make-mobile (make-branch 12 13) (make-branch 14 15)))))

(define balanced-m
  (make-mobile
   (make-branch 1 (make-mobile (make-branch 2 3) (make-branch 4 5)))
   (make-branch 1 (make-mobile (make-branch 2 3) (make-branch 4 5)))))

(define (branch-weight branch)
   (let ([structure-or-value (branch-structure branch)])
     (if (list? structure-or-value)
         (structure-weight structure-or-value)
         structure-or-value)))


(define (branch-length-recursive branch)
  (let ([structure-or-value (branch-structure branch)])
    (if (list? structure-or-value)
       (structure-length structure-or-value)
       (branch-length branch))))

(define (structure-length m)
  (+ (branch-length-recursive (left-branch m)) (branch-length-recursive (right-branch m))))

(define (structure-weight m)
  (+ (branch-weight (left-branch m)) (branch-weight (right-branch m))))


(define (is-balanced? m)
  (let ([left-b (left-branch m)]
        [right-b (right-branch m)])
        
  (* (branch-length-recursive left-b) (branch-weight left-b))))

(print (is-balanced? balanced-m))