#lang racket

(define (square x) (* x x))
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items null))

(square-list (list 1 2 3 4))

; (iter (list 1 2 3 4) null)
; (iter (list 2 3 4) (cons 1) null)
; (iter (list 3 4) (cons 4 (cons 1)))
; (iter (list 4) (cons 9 (cons 4 (cons 1))))
; (iter null (cons 16 (cons 9 (cons 4 (cons 1)))))


(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

; Дальние значения списка все-равно оказываются в конце, но только вторым элементом в паре и будут извлекаться
; с помощью cdr
;
; (iter (list 1 2 3 4) null)
; (iter (list 2 3 4) (cons null 1))
; (iter (list 3 4) (cons (cons null 1) 4))
; (iter (list 4) (cons (cons (cons null 1) 4) 9))
; (iter null (cons (cons (cons (cons null 1) 4) 9) 16))


