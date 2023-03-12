#lang racket


(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(subsets (list 1 2 3))

; (subsets (1 2 3))
;   -> (subsets (2 3))
;    -> (subsets (3))
;     -> (subsets ())
;      -> (append (())
;         -> (map
;          -> (lambda (()) (cons 3 (list null)))
;          -> (append (() (3)) (map
;                                (lambda (()) (cons 2 ()))
;                                 (lambda (3) (cons 2 3))  
;          -> (append (() (3) (2) (2 3) (map
;                                        (lambda (()) (cons 1 ()))
;                                        (lambda (3)  (cons 1 3))
;                                         (lambda (2)  (cons 1 2))
;                                         (lambda ((2 3)) (cons 1 2 3))
; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))