#lang scheme


(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))



(define (fold-left op initial sequence)
  (define (iter result rest)
    (print result)
    (newline)
    (if (null? rest)
        result
        (iter (op result (car rest)) (cdr rest))))
  (iter initial sequence))

; (fold-right / 1 (list 1 2 3))
; (fold-left / 1 (list 1 2 3))

; (fold-right list null (list 1 2 3))
; (fold-left list null (list 1 2 3))


; Operation should be commutative -- sum, multiplication
(equal? (fold-right * 1 (list 1 2 3)) (fold-left * 1 (list 1 2 3)))
(equal? (fold-right + 1 (list 1 2 3)) (fold-left + 1 (list 1 2 3)))
