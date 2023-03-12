#lang racket

(define (same-parity first-value . other-values)
  (define (car-or-null l)
    (if (empty? l)
        null
        (car l)))
  (define (cdr-or-null l)
    (if (empty? l)
        null
        (cdr l)))
  (define first-value-is-even (even? first-value))
  (define predicate (lambda (current-value-is-even first-value-is-even) (equal? current-value-is-even fizrst-value-is-even)))
  (define (mutate current-value remainded-values acc)
    (if (predicate (even? current-value) first-value-is-even)
        (list (car-or-null remainded-values) (cdr-or-null remainded-values) (append acc (list current-value)))
        (list (car-or-null remainded-values) (cdr-or-null remainded-values) acc)))
  
  (define iter (lambda (current-value remainded-values acc)
                (if (empty? remainded-values)
                    (list-ref (mutate current-value remainded-values acc) 2)
                    (apply iter (mutate current-value remainded-values acc)))))

  (iter first-value other-values (list)))

(println (same-parity 13 2 3 4 5 6 7))
