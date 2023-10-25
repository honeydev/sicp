#lang racket

(require "lib.rkt")

(enumerate-interval 1 5)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))


(define (find-pair pairs pair)
  (if (empty? pairs)
      #f
      (let ([first (car pair)][second (cadr pair)])
        (not
         (empty?
          (filter
           (lambda (p) (and (= (car p) first) (= (cadr p) second)))
           pairs))))))

(define (unique-pairs n)
  (let ([pairs
         (flatmap
          (lambda (i)
            (map (lambda (j) (list i j))
                 (range 1 (- i 1))))
          (range 1 n))])
    (map make-pair-sum (filter pair-sum-prime? pairs))))


(define (prime? n)
  (define (test divisor)
    (cond ((>  (* divisor divisor) n) #t)
          ((= (remainder n divisor) 0) #f)
          (else (test (+ divisor 1)))))
  (test 2))

(define (pair-sum-prime? p)
  (prime? (+ (car p) (cadr p))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(println (unique-pairs 11))

(println (flatmap (lambda (x) (list x)) (list 1 2 3)))