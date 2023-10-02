#lang racket

(require rackunit)


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))


(define (find-triple n)
                    (filter (lambda (t) (= (accumulate + 0 t) n))
                     (flatmap
                      (lambda (i)
                        (flatmap
                         (lambda (j)
                           (map
                            (lambda (k) (list i j k))
                            (range 1 j)))
                         (range 1 i)))
                        (range 1 n))))


(for-each
 (lambda (r) (check-eq? 8 (accumulate + 0 r)))
 (find-triple 8))


 (define (unique-tuples n k) 
     (cond ((< n k) null) 
           ((= k 0) (list null)) 
           (else (append (unique-tuples (- n 1) k) 
                         (map (lambda (tuple) (cons n tuple)) 
                              (unique-tuples (- n 1) (- k 1))))))) 
  
 ; application to the case of 3-tuples 
 (define (triples-of-sum s n) 
     (filter (lambda (seq) (= (accumulate + 0 seq) s)) 
             (unique-tuples n 3))) 
 (triples-of-sum 20 30) 