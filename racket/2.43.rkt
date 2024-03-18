#lang racket

 
(require "lib.rkt")

(define empty-board null)
(define (adjoin-position row col other)
  (cons (list row col) other))

;        (flatmap
;          (lambda (rest-of-queens)
;           (map (lambda (new-row)
;                   (adjoin-position new-row k rest-of-queens))
;                 (enumerate-interval 1 board-size)))
;          (queen-cols (- k 1))))))

; Оригинальный алгоритм работает следущим образом.
; порождаем рекурсивно стек вызовов queen-cols - k 1
; 1)
;    (queen-cols 3
;       (queen-cols 2
;          (queen-cols 1
;             (queen-cols 0
;                 в базовом случае рекурсии queen-cols отдает список c пустой доской или (list null) или (()) т.е. содержащим один элемент null,
; 2)              далее данный список заполняется элементами при разворте стека и служит аккамулятором всех способов расстановки
;                 
; 3)              в каждом стеке рекурсии начинается маппинг по всем элементам списка вернувшегося из рекурсивного вызова
; 4)              в Первом случае это будет итерация по (()) и добавление позицй в него согласно перечислению представляющему номера строк,
;                 где добавление позиций это добавление пары с новой позиции ко всем прочим предыдущим  (cons (list row col) other))
;                 где row это new-row число из перечислкения, col это k номер колонки а other это все прочие случаи
;                           (queen-cols k = 1)
;                             (flatmap
;                                 (lambda ( rest-of-queens = (()) )
;                                     (map
;                                           (lambda (new-row = 1)
;                                               (adjoin-position new-row = 1  k = 1 rest-of-queens = (()))
;                                            
;                                           (lambda (new-row = 2)
;                                               (adjoin-position new-row = 2  k = 1 rest-of-queens = (()))
;                                           (lambda (new-row = 3)
;                                               (adjoin-position new-row = 3  k = 1 rest-of-queens = (()))


;                далее все выравнивается в список списков (list (list (1 1)) (list (1 2)) (list (1 3))) где каждый элемент списка это список позиций
;                далее список фильтурется срезаются всепозиции с пересекающимися координатами
;                далее уходим по стеку рекурсии выше 
;                                                     
;                   
;                  

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions)
            (safe-2? k positions))
            (flatmap
                  (lambda (new-row)
                           (map (lambda (rest-of-queens)
                                  (println rest-of-queens)
                                (adjoin-position new-row k rest-of-queens))
                                (queen-cols (- k 1))))
          (enumerate-interval 1 board-size)))))
  (queen-cols board-size))
; в базовом случае рекурсии queen-cols отдает список c пустой доской или (list null) или (()) т.е. содержащим один элемент null,
; мапимся по перечислению по размеру доски где каждое число номер строки
; для каждой строки порождаем рекурсивный вызов (- queen-cols 1)
; получаем
; (map
;      (new-row = 1)
;          (map (rest-of-queens = (list null))
;                (addjoin-position new-rows = 1 k = 1 rest-of-queens = (list null)))
;      (new-row = 2)
;           (map (rest-of-queens = (list null))
;                (addjoin-position new-rows = 2 k = 1 rest-of-queens = (list null)))


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


(println (length (queens 4)))
