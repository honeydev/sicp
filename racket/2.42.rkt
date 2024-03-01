#lang racket
 
(require rackunit)
(require "lib.rkt")
(require rackunit)

(define empty-board null)
(define (adjoin-position row col other)
  (cons (list row col) other))

; берем первую позицию из списка
; берем следующую позицию
; если позиция существует проверяем координаты:
; вертикаль и горизонатль не должны быть равны
; диагональ совпадает если вертикаль > на 1 и горизонатль > на 1
; (1 1) (2 2) если одно из условий не выполнено возвращаем #f
; если последнего элемента нет возвращаем #t

(define (safe? k pos)

  (println "k")

  (println k)
  (println "check pos")
  (println pos)
    
  (define (check cur-pos other)
    (println "cur-pos")
    (println cur-pos)
    (println "other")
    (println other)
    (println "next-pos")
    (println (car other))
    (let* ([cur-vertical (car cur-pos)]
          [cur-horizontal (cadr cur-pos)]
          [next-pos (car other)]
          [next-vertical (car next-pos)]
          [next-horizontal (cadr next-pos)])
      (println "cur-vertical")
      (println cur-vertical)
      (println "cur-horizontal")
      (println cur-horizontal)
      (println "ZZZZ") (println next-vertical)
          (cond ((or
                 (= cur-vertical next-vertical)
                 (= cur-horizontal next-horizontal)
                  (and
                   (= (abs (- cur-vertical next-vertical)) 1)
                   (= (abs (- cur-horizontal next-horizontal)) 1))) #f)
                ((empty? (cdr other)) #t)
            ;    (else (safe? (- k 1) next-pos)))))
               (else (check next-pos (cdr other))))))
   
  (if (or (= k 0) (= k 1))
      #t
      (check (car pos) (cdr pos))))

         ; (cond ((or
         ;         (= cur-vertical next-vertical)
         ;         (= cur-horizontal next-horizontal)
         ;         (and (= (+ cur-vertical 1) next-vertical) (= (+ cur-hortizontal 1) next-hortizontal))) #f)
         ;       ((empty? (cdr next-pos)) #t)
;                (else #t)))))
          
 

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions)
            (safe-2? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (println "rest-of-queens")
            (println rest-of-queens)
            (map (lambda (new-row)
                   (println "new-row")
                   (println new-row)
                   (println "new-position")
                   (println (cons (list new-row k) rest-of-queens))
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))


(define (safe-2? k positions)
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
                  (= cur-pos-y other-pos-y)))))
       (remove position positions))))
  positions))
(check-equal? #t #t)

(define (gen-diagonal-positions position)
  (let* ([x-pos (car position)]
         [y-pos (cadr position)]
         [min-value (- x-pos y-pos)])
    (cond ((< min-value 0) (list (cons 0 (abs min-value)) (cons (- 8 (abs min-value)) 8)))
          ((= min-value 0) (list 0 0))
          (else (list min-value 0)))))

; (println (car (cdr (queens 4))))
; (length (queens 4))


; (safe2? 1 '((4 4) (1 3) (3 2) (1 1)))

(safe-2? 1 '((4 4) (1 3) (3 2) (1 1)))
;(gen-diagonal-positions (list 5 4))
;(gen-diagonal-positions (list 3 7))
(gen-diagonal-positions (list 3 4))
