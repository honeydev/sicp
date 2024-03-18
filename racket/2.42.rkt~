#lang racket
 
(require "lib.rkt")

(define empty-board null)
(define (adjoin-position row col other)
  (cons (list row col) other))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions)
            (safe-2? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))


(define (safe-2? k positions)
 (all?
  (flatmap
   (lambda (position)
     (let* ([cur-pos-x (car position)]
            [cur-pos-y (cadr position)])
       (map
        (lambda (other-pos)
          (let* ([other-pos-x (car other-pos)]
                 [other-pos-y (cadr other-pos)])
            (not
             (or
              (= cur-pos-x other-pos-x)
              (= cur-pos-y other-pos-y)
             ; if difference point (between two points) X,Y equal by mod then points on single diagonal
              (and (= (abs (- cur-pos-x other-pos-x)) (abs (- cur-pos-y other-pos-y))))
              ))))
        (remove position positions))))
   positions)
  (lambda (x) (boolean=? #t x))))


(println (length (queens 8)))
