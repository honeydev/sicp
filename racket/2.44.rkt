#lang racket


(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller  (up-split painter (- n 1))))
        (bellow painter (beside smaller smaller)))))

