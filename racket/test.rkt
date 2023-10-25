#lang racket

(require "lib.rkt")


(accumulate append
            null
            (map (lambda (i)
   
                   (map (lambda (j)
                          (println i)
                          (println j)
                          (newline)
                          (list i j))
                    
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 3)))
            